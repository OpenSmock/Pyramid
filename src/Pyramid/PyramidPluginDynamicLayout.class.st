Class {
	#name : 'PyramidPluginDynamicLayout',
	#superclass : 'Object',
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'leftButton',
		'rightButton',
		'isLeftOpened',
		'isRightOpened',
		'editorWindow'
	],
	#category : 'Pyramid-plugin-dynamic-layout',
	#package : 'Pyramid',
	#tag : 'plugin-dynamic-layout'
}

{ #category : 'adding' }
PyramidPluginDynamicLayout >> addPanelsOn: aPyramidWindow [

	aPyramidWindow
		at: #topLeft
		addItem: [ :builder |
		builder makeButtonWithIcon: self leftButton order: -9999 ].
	aPyramidWindow
		at: #topRight
		addItem: [ :builder |
		builder makeButtonWithIcon: self rightButton order: 9999 ]
]

{ #category : 'as yet unclassified' }
PyramidPluginDynamicLayout >> changeEditorLayout [

	| strategy |
	strategy := self isLeftOpened
		            ifTrue: [
			            self isRightOpened
				            ifTrue: [ PyramidDynamicLayoutAllPanels new ]
				            ifFalse: [ PyramidDynamicLayoutOnlyLeft new ] ]
		            ifFalse: [
			            self isRightOpened
				            ifTrue: [ PyramidDynamicLayoutOnlyRight new ]
				            ifFalse: [ PyramidDynamicLayoutOnlyCenter new ] ].
	self editorWindow layoutStrategy: strategy
]

{ #category : 'as yet unclassified' }
PyramidPluginDynamicLayout >> changeLeftLayout [

	self isLeftOpened: self isLeftOpened not.
	self leftButton help: self leftButtonHelp.
	self changeEditorLayout
]

{ #category : 'as yet unclassified' }
PyramidPluginDynamicLayout >> changeRightLayout [

	self isRightOpened: self isRightOpened not.
	self rightButton help: self rightButtonHelp.
	self changeEditorLayout
]

{ #category : 'actions' }
PyramidPluginDynamicLayout >> configureBuilder: aPyramidBuilder [

	editorWindow := PyramidDynamicWindow new.
	aPyramidBuilder window: editorWindow
]

{ #category : 'connecting' }
PyramidPluginDynamicLayout >> connectOn: aPyramidEditor [

	self changeEditorLayout
]

{ #category : 'accessing' }
PyramidPluginDynamicLayout >> editorWindow [
	^ editorWindow
]

{ #category : 'initialization' }
PyramidPluginDynamicLayout >> initialize [

	isLeftOpened := true.
	isRightOpened := true.

	leftButton := SpButtonPresenter new
		              icon: (self iconNamed: #solidMenu);
		              action: [ self changeLeftLayout ];
		              help: self leftButtonHelp;
		              yourself.
	rightButton := SpButtonPresenter new
		               icon: (self iconNamed: #solidMenu);
		               action: [ self changeRightLayout ];
		               help: self rightButtonHelp;
		               yourself
]

{ #category : 'accessing' }
PyramidPluginDynamicLayout >> isLeftOpened [

	^ isLeftOpened
]

{ #category : 'accessing' }
PyramidPluginDynamicLayout >> isLeftOpened: anObject [

	isLeftOpened := anObject
]

{ #category : 'accessing' }
PyramidPluginDynamicLayout >> isRightOpened [

	^ isRightOpened
]

{ #category : 'accessing' }
PyramidPluginDynamicLayout >> isRightOpened: anObject [

	isRightOpened := anObject
]

{ #category : 'accessing' }
PyramidPluginDynamicLayout >> leftButton [
	^ leftButton
]

{ #category : 'as yet unclassified' }
PyramidPluginDynamicLayout >> leftButtonHelp [

	self isLeftOpened ifTrue: [ ^ 'Hide left panel' ] ifFalse: [ ^ 'Show left panel' ]
]

{ #category : 'accessing' }
PyramidPluginDynamicLayout >> rightButton [

	^ rightButton
]

{ #category : 'as yet unclassified' }
PyramidPluginDynamicLayout >> rightButtonHelp [

	self isRightOpened
		ifTrue: [ ^ 'Hide right panel' ]
		ifFalse: [ ^ 'Show right panel' ]
]
