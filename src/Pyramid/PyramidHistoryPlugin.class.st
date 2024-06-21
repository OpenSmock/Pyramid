Class {
	#name : 'PyramidHistoryPlugin',
	#superclass : 'Object',
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'undoButton',
		'redoButton',
		'history',
		'projectModel'
	],
	#category : 'Pyramid-history',
	#package : 'Pyramid',
	#tag : 'history'
}

{ #category : 'adding' }
PyramidHistoryPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #topCenter
		addItem: [ :builder |
		builder makeButtonWithIcon: self undoButton order: 10 ].
	aPyramidSimpleWindow
		at: #topCenter
		addItem: [ :builder |
		builder makeButtonWithIcon: self redoButton order: 20 ]
]

{ #category : 'connecting' }
PyramidHistoryPlugin >> connectOn: aPyramidEditor [

	self history: aPyramidEditor propertiesManager history.
	self projectModel: aPyramidEditor projectModel.
	self pyramidElementsChanged: nil.
]

{ #category : 'accessing' }
PyramidHistoryPlugin >> history [

	^ history
]

{ #category : 'accessing' }
PyramidHistoryPlugin >> history: anObject [

	history := anObject
]

{ #category : 'as yet unclassified' }
PyramidHistoryPlugin >> initialize [

	undoButton := SpButtonPresenter new
		              icon: (Smalltalk ui icons iconNamed: #smallUndo);
		              action: [
			              self history undo.
			              self projectModel informElementsChanged ];
						 enabled: false;
		              help: 'Undo';
		              yourself.
	redoButton := SpButtonPresenter new
		              icon: (Smalltalk ui icons iconNamed: #smallRedo);
		              action: [
			              self history redo.
			              self projectModel informElementsChanged ];
						 enabled: false;
		              help: 'Redo';
		              yourself
]

{ #category : 'accessing' }
PyramidHistoryPlugin >> projectModel [

	^ projectModel
]

{ #category : 'accessing' }
PyramidHistoryPlugin >> projectModel: anObject [

	projectModel := anObject.
	projectModel announcer
		when: PyramidElementsChangedEvent
		do: [ :evt | self pyramidElementsChanged: evt ]
		for: self
]

{ #category : 'as yet unclassified' }
PyramidHistoryPlugin >> pyramidElementsChanged: anEvent [

	undoButton enabled: self history canUndo.
	redoButton enabled: self history canRedo
]

{ #category : 'accessing' }
PyramidHistoryPlugin >> redoButton [

	^ redoButton
]

{ #category : 'accessing' }
PyramidHistoryPlugin >> undoButton [

	^ undoButton
]
