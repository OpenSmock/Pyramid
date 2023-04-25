Class {
	#name : #PyramidHistoryPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'history',
		'undoButton',
		'redoButton',
		'historyView',
		'historyTab'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #'class initialization' }
PyramidHistoryPlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> buildViewFrom: aPyramidGlobalViewBuilder [

	aPyramidGlobalViewBuilder model tools add: self undoButton.
	aPyramidGlobalViewBuilder model tools add: self redoButton.
	aPyramidGlobalViewBuilder model rightTabs add: self historyTab
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
PyramidHistoryPlugin >> historyTab [
^ historyTab
]

{ #category : #initialization }
PyramidHistoryPlugin >> initialize [ 

	history := PyramidHistory new.
	self initializeButtons.
	self initializeHistoryTab.
]

{ #category : #initialization }
PyramidHistoryPlugin >> initializeButtons [

	undoButton := PyramidToggleButton new
		              icon: (self iconNamed: #smallUndo);
		              alignStart;
		              order: 100;
		              callback: [ self history undo ];
		              state: [ self history canUndo ];
		              yourself.
	redoButton := PyramidToggleButton new
		              icon: (self iconNamed: #smallRedo);
		              alignStart;
		              order: 101;
		              callback: [ self history redo ];
		              state: [ self history canRedo ];
		              yourself
]

{ #category : #initialization }
PyramidHistoryPlugin >> initializeHistoryTab [

	historyView := PyramidHistoryView new history: self history; yourself.
	historyTab := PyramidTab new
		              presenter: [ historyView ];
		              title: 'History';
		              icon: (self iconNamed: #history);
		              yourself
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> redoButton [

	^ redoButton
]

{ #category : #'as yet unclassified' }
PyramidHistoryPlugin >> undoButton [
^ undoButton
]
