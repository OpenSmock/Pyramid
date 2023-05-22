Class {
	#name : #PyramidHistoryView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidHistoryObserver',
	#classTraits : 'TPyramidHistoryObserver classTrait',
	#instVars : [
		'undoTree',
		'redoTree',
		'history'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #layout }
PyramidHistoryView >> defaultLayout [

	^ SpBoxLayout newHorizontal
		spacing: 4;
		add: self undoTree;
		add: self redoTree;
		yourself
]

{ #category : #initialization }
PyramidHistoryView >> history [
^ history
]

{ #category : #initialization }
PyramidHistoryView >> history: anHistory [

	history := anHistory.
	anHistory addObserver: self.
]

{ #category : #initialization }
PyramidHistoryView >> initializePresenters [

	undoTree := self newTree
		            beSingleSelection;
		            roots: {  };
		            display: self undoDisplayBlock;
		            children: self undoChildrenBlock;
		            expandRoots.
	redoTree := self newTree
		            beSingleSelection;
		            roots: {  };
		            display: self redoDisplayBlock;
		            children: self redoChildrenBlock;
		            expandRoots
]

{ #category : #'as yet unclassified' }
PyramidHistoryView >> pyramidHistoryCounterReset [

	self updateRoots
]

{ #category : #'as yet unclassified' }
PyramidHistoryView >> pyramidHistoryRedo [

	self updateRoots
]

{ #category : #'as yet unclassified' }
PyramidHistoryView >> pyramidHistoryUndo [

	self updateRoots
]

{ #category : #initialization }
PyramidHistoryView >> redoChildrenBlock [

	^ [ :each |
	  each redoMemento isSequence
		  ifTrue: [ each redoMemento mementos ]
		  ifFalse: [ {  } ] ]
]

{ #category : #initialization }
PyramidHistoryView >> redoDisplayBlock [

	^ [ :each |
	  each redoMemento isSequence
		  ifTrue: [ each redoMemento printString ]
		  ifFalse: [
			  each redoMemento command name printString , ' '
			  , each redoMemento command state arguments printString , ' '
			  , each redoMemento target printString ] ]
]

{ #category : #layout }
PyramidHistoryView >> redoTree [

	^ redoTree
]

{ #category : #initialization }
PyramidHistoryView >> undoChildrenBlock [

	^ [ :each |
	  each undoMemento isSequence
		  ifTrue: [ each undoMemento mementos ]
		  ifFalse: [ {  } ] ]
]

{ #category : #initialization }
PyramidHistoryView >> undoDisplayBlock [

	^ [ :each |
	  each undoMemento isSequence
		  ifTrue: [ each undoMemento printString ]
		  ifFalse: [
			  each undoMemento command name printString , ' '
			  , each undoMemento command state arguments printString , ' '
			  , each undoMemento target printString ] ]
]

{ #category : #layout }
PyramidHistoryView >> undoTree [
^ undoTree
]

{ #category : #accessing }
PyramidHistoryView >> updateRoots [

	self redoTree roots: self history redoCollection.
	self undoTree roots: self history undoCollection 
]
