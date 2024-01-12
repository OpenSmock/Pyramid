Class {
	#name : #PyramidEditorBuilder,
	#superclass : #Object,
	#traits : 'TPyramidSerchablePlugin',
	#classTraits : 'TPyramidSerchablePlugin classTrait',
	#instVars : [
		'plugins',
		'editor',
		'window'
	],
	#category : #'Pyramid-core'
}

{ #category : #building }
PyramidEditorBuilder >> build [

	self plugins do: [ :each | each configureBuilder: self ].

	self editor window: self window.
	self editor plugins: self plugins.

	self plugins do: [ :each | each addPanelsOn: self window ].
	self plugins do: [ :each | each connectOn: self editor ].
	^ editor
]

{ #category : #accessing }
PyramidEditorBuilder >> editor [

	^ editor
]

{ #category : #building }
PyramidEditorBuilder >> initialize [

	editor := PyramidEditor new
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

	self plugins remove: aPlugin
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
