Class {
	#name : #PyramidHistory,
	#superclass : #Object,
	#traits : 'TPyramidHistory',
	#classTraits : 'TPyramidHistory classTrait',
	#instVars : [
		'afterMementoSaver',
		'beforeMementoSaver',
		'undoCounter',
		'mementos',
		'undoPipeline',
		'mainPipeline',
		'originMemento'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #accessing }
PyramidHistory >> afterMementoSaver [

	^ afterMementoSaver
]

{ #category : #accessing }
PyramidHistory >> beforeMementoSaver [

	^ beforeMementoSaver.
]

{ #category : #testing }
PyramidHistory >> canRedo [

	^ self redoCollection isNotEmpty 
]

{ #category : #testing }
PyramidHistory >> canUndo [

	^ self undoCollection isNotEmpty
]

{ #category : #initialization }
PyramidHistory >> initialize [

	undoCounter := 0.
	mementos := OrderedCollection new.
	undoPipeline := PyramidPipeline new.
	beforeMementoSaver := PyramidMementoSaverForOriginAndReset new
		                      history: self;
		                      pipeline: self undoPipeline;
		                      yourself.
	afterMementoSaver := PyramidMementoSaver new
		                     collection: self mementos;
		                     pipeline: self undoPipeline;
		                     yourself
]

{ #category : #'as yet unclassified' }
PyramidHistory >> installHistoryOn: aPipeline [

	aPipeline workersBeforeExecute add: self beforeMementoSaver.
	aPipeline workersAfterExecute add: self afterMementoSaver.
	mainPipeline := aPipeline
]

{ #category : #accessing }
PyramidHistory >> mainPipeline [

	^ mainPipeline
]

{ #category : #accessing }
PyramidHistory >> mementos [

	^ mementos
]

{ #category : #testing }
PyramidHistory >> originMemento [

	^ originMemento.
]

{ #category : #testing }
PyramidHistory >> originMemento: anObject [

	originMemento := anObject
]

{ #category : #'menu messages' }
PyramidHistory >> redo [

	self canRedo ifFalse: [ ^ self ].
	self redoCollection last restore.
	self undoCounterDecrement.
	self mainPipeline informPipelineExecuteCommand.
	self informRedo
]

{ #category : #accessing }
PyramidHistory >> redoCollection [

	^ self mementos first: self undoCounter
]

{ #category : #initialization }
PyramidHistory >> resetUndoCounter [

	undoCounter := 0.
	self informCounterReset
	
]

{ #category : #'menu messages' }
PyramidHistory >> undo [

	self canUndo ifFalse: [ ^ self ].
	self undoCollection first restore.
	self undoCounterIncrement.
	self mainPipeline informPipelineExecuteCommand.
	self informUndo
]

{ #category : #accessing }
PyramidHistory >> undoCollection [

	self originMemento ifNotNil: [
		^ (self mementos allButFirst
			  addLast: self originMemento;
			  yourself) allButFirst: self undoCounter].
	^ {  }
]

{ #category : #testing }
PyramidHistory >> undoCounter [

	^ undoCounter
]

{ #category : #testing }
PyramidHistory >> undoCounterDecrement [

	undoCounter := undoCounter - 1
]

{ #category : #testing }
PyramidHistory >> undoCounterIncrement [

	undoCounter := undoCounter + 1
]

{ #category : #accessing }
PyramidHistory >> undoPipeline [
^undoPipeline
]
