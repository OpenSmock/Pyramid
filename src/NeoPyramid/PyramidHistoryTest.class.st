Class {
	#name : #PyramidHistoryTest,
	#superclass : #TestCase,
	#instVars : [
		'command',
		'targets',
		'dummys',
		'history',
		'pipeline'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #'as yet unclassified' }
PyramidHistoryTest >> commandToChangeState [

	^ PyramidCommand
		  set: [ :state :target | target set: state arguments ]
		  get: [ :state :obj |
			  state source: obj.
			  state arguments: obj get ]
		  isExecutableBlock: [ :obj :state | true ]
]

{ #category : #running }
PyramidHistoryTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	command := self commandToChangeState.
	targets := PyramidPipelineTarget new.
	dummys := {
		          PyramidHistoryTestDummy new }.
	history := PyramidHistory new.
	pipeline := PyramidPipeline new.
	history installHistoryOn: pipeline
]

{ #category : #tests }
PyramidHistoryTest >> testCanRedo [
	"Test:
	
	Verify can not redo.
	Change one state.
	Verify can not redo.
	Undo.
	Verify can redo.
	Redo.
	Verify can not redo.
	Change one state.
	Change one state.
	Verify can not redo.
	Undo.
	Verify can redo.
	Change one state.
	Verify can not redo.
	"

	self deny: history canRedo.
	self useCommandWith: 1.
	self deny: history canRedo.

	"one undo"
	history undo.
	self assert: history canRedo.
	history redo.
	self deny: history canRedo.

	"no undo"
	self useCommandWith: 2.
	self useCommandWith: 3.
	self deny: history canRedo.

	"one undo"
	history undo.
	self assert: history canRedo.
	"no undo"
	self useCommandWith: 4.
	self deny: history canRedo
]

{ #category : #tests }
PyramidHistoryTest >> testCanUndo [

	"Test:
	
	Verify can not undo.
	Change one state.
	Verify can undo.
	Undo.
	Verify can not undo."
	self assert: (dummys allSatisfy: [ :each | each get = 0 ]).
	self deny: history canUndo.
	self useCommandWith: 1.
	self assert: history canUndo.
	history undo.
	self deny: history canUndo
]

{ #category : #tests }
PyramidHistoryTest >> testRedo [
	"Test:
	
	Create a command that change the state of an object.
	Create a collection of object.
	Change 3 times the sate of the object.
	Undo then verify state 3 times.
	Then redo and verify 3 times.
	Redo one more time and verify nothing change.
	Undo then verify state 3 times.
	Change state
	Redo one more time and verify nothing change."

	self assert: (dummys allSatisfy: [ :each | each get = 0 ]).
	self useCommandWith: 1.
	self useCommandWith: 2.
	self useCommandWith: 3.
	self deny: history canRedo.
	self assert: (dummys allSatisfy: [ :each | each get = 3 ]).
	history undo.
	self assert: history canRedo.
	self assert: (dummys allSatisfy: [ :each | each get = 2 ]).
	history undo.
	self assert: (dummys allSatisfy: [ :each | each get = 1 ]).
	history undo.
	self assert: (dummys allSatisfy: [ :each | each get = 0 ]).
	history redo.
	self assert: (dummys allSatisfy: [ :each | each get = 1 ]).
	history redo.
	self assert: (dummys allSatisfy: [ :each | each get = 2 ]).
	history redo.
	self assert: (dummys allSatisfy: [ :each | each get = 3 ]).
	self deny: history canRedo.
	history redo.
	self assert: (dummys allSatisfy: [ :each | each get = 3 ]).
	history undo.
	history undo.
	self assert: (dummys allSatisfy: [ :each | each get = 1 ]).
	self useCommandWith: 4.
	self assert: (dummys allSatisfy: [ :each | each get = 4 ]).
	self deny: history canRedo.
	history redo.
	self assert: (dummys allSatisfy: [ :each | each get = 4 ])
]

{ #category : #tests }
PyramidHistoryTest >> testRedoCollection [
	"Test:
	
	Verify redoCollection has 0 memento in it.
	Create a command that change the state of an object.
	Create a collection of object.
	Change 3 times the sate of the object.
	Undo 3 times
	Verify redoCollection has 3 mementos in it.
	Redo 3 times
	Verify redoCollection has 0 memento in it.
	"
	self assert: history redoCollection size equals: 0.
	self useCommandWith: 1.
	self useCommandWith: 2.
	self useCommandWith: 3.
	self assert: history redoCollection size equals: 0.
	history undo.
	history undo.
	history undo.
	self assert: history redoCollection size equals: 3.
	history redo.
	history redo.
	history redo.
	self assert: history redoCollection size equals: 0
	
]

{ #category : #tests }
PyramidHistoryTest >> testUndo [
	"Test:
	
	Create a command that change the state of an object.
	Create a collection of object.
	Change 3 times the sate of the object.
	Undo then verify state 3 times.
	Undo one more time.
	Verify nothing change"

	self assert: (dummys allSatisfy: [ :each | each get = 0 ]).
	self deny: history canUndo.
	self useCommandWith: 1.
	self assert: history canUndo.
	self useCommandWith: 2.
	self useCommandWith: 3.
	self assert: (dummys allSatisfy: [ :each | each get = 3 ]).
	history undo.
	self assert: (dummys allSatisfy: [ :each | each get = 2 ]).
	history undo.
	self assert: (dummys allSatisfy: [ :each | each get = 1 ]).
	self assert: history canUndo.
	history undo.
	self assert: (dummys allSatisfy: [ :each | each get = 0 ]).
	self deny: history canUndo.
	history undo.
	self assert: (dummys allSatisfy: [ :each | each get = 0 ])
]

{ #category : #tests }
PyramidHistoryTest >> testUndoCollection [
	"Test:
	
	Verify undoCollection has 0 memento in it.
	Create a command that change the state of an object.
	Create a collection of object.
	Change 3 times the sate of the object.
	Verify undoCollection has 3 mementos in it.
	Undo 3 times
	Verify undoCollection has 0 memento in it.
	Redo 3 times
	Verify undoCollection has 3 mementos in it.
	"

	self assert: history undoCollection size equals: 0.
	self useCommandWith: 1.
	self useCommandWith: 2.
	self useCommandWith: 3.
	self assert: history undoCollection size equals: 3.
	history undo.
	history undo.
	history undo.
	self assert: history undoCollection size equals: 0.
	history redo.
	history redo.
	history redo.
	self assert: history undoCollection size equals: 3.
]

{ #category : #'as yet unclassified' }
PyramidHistoryTest >> useCommandWith: anArgument [

	command state arguments: anArgument.
	targets collection: dummys.
	pipeline useCommand: command on: targets.
]
