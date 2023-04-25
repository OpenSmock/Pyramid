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

{ #category : #initialization }
PyramidHistoryView >> childrenBlock [

	^ [ :each |
			            each isSequence
				            ifTrue: [ each mementos ]
				            ifFalse: [ {  } ] ]
]

{ #category : #layout }
PyramidHistoryView >> defaultLayout [

	^ SpBoxLayout newHorizontal
		spacing: 4;
		add: self undoTree;
		add: self redoTree;
		yourself
]

{ #category : #initialization }
PyramidHistoryView >> displayBlock [

	^ [ :each |
	  each isSequence
		  ifTrue: [ each printString ]
		  ifFalse: [
			  each command name printString , ' '
			  , each command state arguments printString , ' ' , each target printString ] ]
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
		            display: self displayBlock;
		            children: self childrenBlock;
		            expandRoots.
	redoTree := self newTree
		            beSingleSelection;
		            roots: {  };
		            display: self displayBlock;
		            children: self childrenBlock;
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

{ #category : #layout }
PyramidHistoryView >> redoTree [

	^ redoTree
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
