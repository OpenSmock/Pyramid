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

{ #category : #'as yet unclassified' }
PyramidPluginDynamicLayout >> buildViewFrom: aPyramidGlobalViewBuilder [

	aPyramidGlobalViewBuilder model tools add: self leftButton.
	aPyramidGlobalViewBuilder model tools add: self rightButton
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

	editorView := aPyramidEditor view.
	self changeEditorLayout
]

{ #category : #accessing }
PyramidPluginDynamicLayout >> editorView [
	^ editorView
]

{ #category : #initialization }
PyramidPluginDynamicLayout >> initialize [

	leftButton := PyramidToggleButton new
		              icon: (self iconNamed: #solidMenu);
		              alignStart;
		              order: -1000;
		              callback: [ self changeEditorLayout ];
		state: true;
		              yourself.
	rightButton := PyramidToggleButton new
		               icon: (self iconNamed: #solidMenu);
		               alignEnd;
		               order: 1000;
		               callback: [ self changeEditorLayout ];
		state: true;
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
