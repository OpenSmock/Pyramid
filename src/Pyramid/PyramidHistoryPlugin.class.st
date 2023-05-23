Class {
	#name : #PyramidHistoryPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidHistoryObserver',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidHistoryObserver classTrait',
	#instVars : [
		'history',
		'undoButton',
		'redoButton',
		'historyView'
	],
	#category : #'Pyramid-plugin-history'
}

{ #category : #'class initialization' }
PyramidHistoryPlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidHistoryPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self historyView
			label: 'History'
			icon: (self iconNamed: #history)
			order: 30 ].

	aPyramidSimpleWindow
		at: #topCenter
		addItem: [ :builder |
		builder makeButtonWithIcon: self undoButton order: 1 ].
	aPyramidSimpleWindow
		at: #topCenter
		addItem: [ :builder |
		builder makeButtonWithIcon: self redoButton order: 2 ]
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> connectOn: aPyramidEditor [

	self history installHistoryOn: aPyramidEditor commandPipeline
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> history [

	^history
]

{ #category : #accessing }
PyramidHistoryPlugin >> historyView [
^ historyView
]

{ #category : #initialization }
PyramidHistoryPlugin >> initialize [

	history := PyramidHistory new.
	history addObserver: self.
	
	historyView  := PyramidHistoryView new
		               history: self history;
		               yourself.
		
	self initializeButtons.

]

{ #category : #initialization }
PyramidHistoryPlugin >> initializeButtons [

	undoButton := SpButtonPresenter new
		              icon: (self iconNamed: #smallUndo);
		              action: [ self history undo ];
		              enabled: self history canUndo;
		              yourself.
	redoButton := SpButtonPresenter new
		              icon: (self iconNamed: #smallRedo);
		              action: [
			              self history redo.
			               ];
		              enabled: self history canRedo;
		              yourself
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> pyramidHistoryCounterReset [

	self updateButtons
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> pyramidHistoryRedo [

	self updateButtons
	
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> pyramidHistoryUndo [

	self updateButtons
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> redoButton [

	^ redoButton
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> undoButton [
^ undoButton
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> updateButtons [

	self undoButton enabled: self history canUndo.
	self redoButton enabled: self history canRedo
]
