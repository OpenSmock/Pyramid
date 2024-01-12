Class {
	#name : #PyramidEditorBuilder,
	#superclass : #Object,
	#traits : 'TPyramidSerchablePlugin',
	#classTraits : 'TPyramidSerchablePlugin classTrait',
	#instVars : [
		'plugins',
		'editor',
		'window',
		'cannotBuildPlugins'
	],
	#category : #'Pyramid-core'
}

{ #category : #building }
PyramidEditorBuilder >> build [

	self plugins asArray do: [ :each | each configureBuilder: self ].

	self editor plugins: self plugins.
	self editor window: self window.

	self plugins do: [ :each | each addPanelsOn: self window ].
	self plugins do: [ :each | each connectOn: self editor ].

	self cannotBuildPlugins do: [ :each |
		self editor window
			atMessagesAddItem: [ :builder | builder addMessage: each asPyramidMessage ] ].
	^ editor
]

{ #category : #accessing }
PyramidEditorBuilder >> cannotBuildPlugins [

	^ cannotBuildPlugins
]

{ #category : #'as yet unclassified' }
PyramidEditorBuilder >> doNotBuildWith: aPyramidPlugin because: aPyramidError [

	self removePlugin: aPyramidPlugin.
	self cannotBuildPlugins add: (PyramidCannotBuildMessageItem new source: aPyramidPlugin; because: aPyramidError; yourself)
]

{ #category : #accessing }
PyramidEditorBuilder >> editor [

	^ editor
]

{ #category : #building }
PyramidEditorBuilder >> initialize [

	editor := PyramidEditor new.
	cannotBuildPlugins := OrderedCollection new.
]

{ #category : #accessing }
PyramidEditorBuilder >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidEditorBuilder >> plugins: anObject [

	plugins := anObject
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
