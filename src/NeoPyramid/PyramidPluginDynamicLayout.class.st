Class {
	#name : #PyramidPluginDynamicLayout,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'spaceView',
		'leftButton',
		'rightButton',
		'editorView'
	],
	#category : #'NeoPyramid-plugin-dynamic-layout'
}

{ #category : #initialization }
PyramidPluginDynamicLayout class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidPluginDynamicLayout >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #topLeft
		addItem: [ :builder |
		builder makeButtonWithIcon: self leftButton order: -1000 ].
	aPyramidSimpleWindow
		at: #topRight
		addItem: [ :builder |
		builder makeButtonWithIcon: self rightButton order: 9999 ]
]

{ #category : #'as yet unclassified' }
PyramidPluginDynamicLayout >> changeEditorLayout [

	| strategy |
	strategy := self leftButton state
		            ifTrue: [
			            self rightButton state
				            ifTrue: [ PyramidSimpleLayoutStrategy new ]
				            ifFalse: [ PyramidLeftLayoutStrategy new ] ]
		            ifFalse: [
			            self rightButton state
				            ifTrue: [ PyramidRightLayoutStrategy new ]
				            ifFalse: [ PyramidCenterLayoutStrategy new ] ].
	self editorView layoutStrategy: strategy.
	self editorView updateLayout
]

{ #category : #'as yet unclassified' }
PyramidPluginDynamicLayout >> connectOn: aPyramidEditor [

	self flag: #TODO. "Changement de layout désactiver à cause de la nouvelle vue"
	"self changeEditorLayout"
]

{ #category : #accessing }
PyramidPluginDynamicLayout >> editorView [
	^ editorView
]

{ #category : #initialization }
PyramidPluginDynamicLayout >> initialize [

	leftButton := SpButtonPresenter new
		              icon: (self iconNamed: #solidMenu);
		              yourself.
	rightButton := SpButtonPresenter new
		               icon: (self iconNamed: #solidMenu);
		               yourself
]

{ #category : #accessing }
PyramidPluginDynamicLayout >> leftButton [
	^ leftButton
]

{ #category : #accessing }
PyramidPluginDynamicLayout >> rightButton [

	^ rightButton
]
