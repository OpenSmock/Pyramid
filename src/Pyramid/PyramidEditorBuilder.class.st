Class {
	#name : #PyramidEditorBuilder,
	#superclass : #Object,
	#traits : 'TPyramidSerchablePlugin',
	#classTraits : 'TPyramidSerchablePlugin classTrait',
	#instVars : [
		'plugins',
		'editor',
		'window',
		'cannotBuildPluginsMessages'
	],
	#category : #'Pyramid-core'
}

{ #category : #building }
PyramidEditorBuilder >> build [

	self checkDependencies.
	self orderPluginsBeforeBuild.
	self plugins do: [ :each | each configureBuilder: self ].

	self editor plugins: self plugins.
	self editor window: self window.

	self plugins do: [ :each | each addPanelsOn: self window ].
	self plugins do: [ :each | each connectOn: self editor ].

	self cannotBuildPluginsMessages do: [ :each |
		self editor window atMessagesAddItem: [ :builder |
			builder addMessage: each asPyramidMessage ] ].
	^ editor
]

{ #category : #accessing }
PyramidEditorBuilder >> cannotBuildPluginsMessages [

	^ cannotBuildPluginsMessages
]

{ #category : #dependencies }
PyramidEditorBuilder >> checkDependencies [

	| listOfPlugins |
	listOfPlugins := self plugins asArray.
	listOfPlugins do: [ :each | [each checkDependenciesWith: self plugins] on: PyramidPluginNotFoundError do: [ :err | self doNotBuildWith: each because: err ] ]
]

{ #category : #'as yet unclassified' }
PyramidEditorBuilder >> doNotBuildWith: aPyramidPlugin because: aPyramidError [

	self removePlugin: aPyramidPlugin.
	self cannotBuildPluginsMessages add: (PyramidCannotBuildMessageItem new
			 source: aPyramidPlugin;
			 because: aPyramidError;
			 yourself)
]

{ #category : #accessing }
PyramidEditorBuilder >> editor [

	^ editor
]

{ #category : #building }
PyramidEditorBuilder >> initialize [

	editor := PyramidEditor new.
	cannotBuildPluginsMessages := OrderedCollection new
]

{ #category : #dependencies }
PyramidEditorBuilder >> orderPluginsBeforeBuild [

	self plugins: self plugins sorted
]

{ #category : #accessing }
PyramidEditorBuilder >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidEditorBuilder >> plugins: aCollection [

	plugins := aCollection
]

{ #category : #removing }
PyramidEditorBuilder >> removePlugin: aPlugin [

	self plugins: (self plugins copyWithout: aPlugin)
]

{ #category : #building }
PyramidEditorBuilder >> window [

window ifNil: [ window := PyramidSimpleWindow new ].
^ window

	
]

{ #category : #building }
PyramidEditorBuilder >> window: aPyramidWindow [

	window ifNotNil: [
		Error signal: 'The window is already set by another plugin !' ].
	window := aPyramidWindow
]
