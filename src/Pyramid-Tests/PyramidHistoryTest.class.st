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
	#category : #'Pyramid-Tests-cases-plugin-history'
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
	dummys := { PyramidHistoryTestDummy new . PyramidHistoryTestDummy new . PyramidHistoryTestDummy new }.
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
PyramidHistoryTest >> testMultiDummysWithVariableTargets [
	"Test:
	
	Create 5 dummys { a, b, c, d, e }.
	Change state of { a, b, c, d } to <1>
	Change state of { a, b, c } to <2>
	Change state of { a, b } to <3>
	Change state of { a } to <4>
	Verify all states: { a=4, b=3, c=2, d=1, e=0 }
	Undo
	Verify all states: { a=3, b=3, c=2, d=1, e=0 }
	Redo
	Verify all states: { a=4, b=3, c=2, d=1, e=0 }
	...
	"

	| a b c d e |
	a := PyramidHistoryTestDummy new.
	b := PyramidHistoryTestDummy new.
	c := PyramidHistoryTestDummy new.
	d := PyramidHistoryTestDummy new.
	e := PyramidHistoryTestDummy new.
	self assert: a get equals: 0.
	self assert: b get equals: 0.
	self assert: c get equals: 0.
	self assert: d get equals: 0.
	self assert: e get equals: 0.

	self useCommandWith: 1 onTarget: {
			a.
			b.
			c.
			d }.
	self assert: a get equals: 1.
	self assert: b get equals: 1.
	self assert: c get equals: 1.
	self assert: d get equals: 1.
	self assert: e get equals: 0.

	self useCommandWith: 2 onTarget: {
			a.
			b.
			c }.
	self assert: a get equals: 2.
	self assert: b get equals: 2.
	self assert: c get equals: 2.
	self assert: d get equals: 1.
	self assert: e get equals: 0.

	self useCommandWith: 3 onTarget: {
			a.
			b }.
	self assert: a get equals: 3.
	self assert: b get equals: 3.
	self assert: c get equals: 2.
	self assert: d get equals: 1.
	self assert: e get equals: 0.

	self useCommandWith: 4 onTarget: { a }.
	self assert: a get equals: 4.
	self assert: b get equals: 3.
	self assert: c get equals: 2.
	self assert: d get equals: 1.
	self assert: e get equals: 0.

	"One undo"

	history undo.
	self assert: a get equals: 3.
	self assert: b get equals: 3.
	self assert: c get equals: 2.
	self assert: d get equals: 1.
	self assert: e get equals: 0.

	history redo.
	self assert: a get equals: 4.
	self assert: b get equals: 3.
	self assert: c get equals: 2.
	self assert: d get equals: 1.
	self assert: e get equals: 0.

	"Two undos"

	history undo.
	history undo.
	self assert: a get equals: 2.
	self assert: b get equals: 2.
	self assert: c get equals: 2.
	self assert: d get equals: 1.
	self assert: e get equals: 0.

	history redo.
	history redo.
	self assert: a get equals: 4.
	self assert: b get equals: 3.
	self assert: c get equals: 2.
	self assert: d get equals: 1.
	self assert: e get equals: 0.

	"Three undos"

	history undo.
	history undo.
	history undo.
	self assert: a get equals: 1.
	self assert: b get equals: 1.
	self assert: c get equals: 1.
	self assert: d get equals: 1.
	self assert: e get equals: 0.

	history redo.
	history redo.
	history redo.
	self assert: a get equals: 4.
	self assert: b get equals: 3.
	self assert: c get equals: 2.
	self assert: d get equals: 1.
	self assert: e get equals: 0.

	"Four undos"

	history undo.
	history undo.
	history undo.
	history undo.
	self assert: a get equals: 0.
	self assert: b get equals: 0.
	self assert: c get equals: 0.
	self assert: d get equals: 0.
	self assert: e get equals: 0.

	history redo.
	history redo.
	history redo.
	history redo.
	self assert: a get equals: 4.
	self assert: b get equals: 3.
	self assert: c get equals: 2.
	self assert: d get equals: 1.
	self assert: e get equals: 0
]

{ #category : #tests }
PyramidHistoryTest >> testMultiDummysWithVariableTargetsWithMementosSizeComparaison [
	"Test:
	
	Create 5 dummys { a, b, c, d, e }.
	Change state of { a, b, c, d } to <1>
	Change state of { a, b, c } to <2>
	Change state of { a, b } to <3>
	Change state of { a } to <4>
	Verify all states: { a=4, b=3, c=2, d=1, e=0 }
	Undo
	Verify all states: { a=3, b=3, c=2, d=1, e=0 }
	Redo
	Verify all states: { a=4, b=3, c=2, d=1, e=0 }
	...
	"

	| a b c d e |
	a := PyramidHistoryTestDummy new.
	b := PyramidHistoryTestDummy new.
	c := PyramidHistoryTestDummy new.
	d := PyramidHistoryTestDummy new.
	e := PyramidHistoryTestDummy new.
	self assert: history undoCollection isEmpty.
	self assert: history redoCollection isEmpty.

	self useCommandWith: 1 onTarget: {
			a.
			b.
			c.
			d }.
	self assert: history undoCollection size equals: 1.
	self assert: (history undoCollection at: 1) undoMemento size equals: 4.
	self assert: history redoCollection isEmpty.
	self useCommandWith: 2 onTarget: {
			a.
			b.
			c }.
	self assert: history undoCollection size equals: 2.
	self assert: (history undoCollection at: 1) undoMemento size equals: 3.
	self assert: (history undoCollection at: 2) undoMemento size equals: 4.
	self assert: history redoCollection isEmpty.

	self useCommandWith: 3 onTarget: {
			a.
			b }.
	self assert: history undoCollection size equals: 3.
	self assert: (history undoCollection at: 1) undoMemento size equals: 2.
	self assert: (history undoCollection at: 2) undoMemento size equals: 3.
	self assert: (history undoCollection at: 3) undoMemento size equals: 4.
	self assert: history redoCollection isEmpty.

	self useCommandWith: 4 onTarget: { a }.
	self assert: history undoCollection size equals: 4.
	self assert: (history undoCollection at: 1) undoMemento size equals: 1.
	self assert: (history undoCollection at: 2) undoMemento size equals: 2.
	self assert: (history undoCollection at: 3) undoMemento size equals: 3.
	self assert: (history undoCollection at: 4) undoMemento size equals: 4.
	self assert: history redoCollection isEmpty.

	"One undo"

	history undo.
	self assert: history undoCollection size equals: 3.
	self assert: (history undoCollection at: 1) undoMemento size equals: 2.
	self assert: (history undoCollection at: 2) undoMemento size equals: 3.
	self assert: (history undoCollection at: 3) undoMemento size equals: 4.
	self assert: history redoCollection size equals: 1.
	self assert: (history redoCollection at: 1) redoMemento size equals: 1.

	history redo.
	self assert: history undoCollection size equals: 4.
	self assert: (history undoCollection at: 1) undoMemento size equals: 1.
	self assert: (history undoCollection at: 2) undoMemento size equals: 2.
	self assert: (history undoCollection at: 3) undoMemento size equals: 3.
	self assert: (history undoCollection at: 4) undoMemento size equals: 4.
	self assert: history redoCollection isEmpty.

	"Two undos"

	history undo.
	history undo.
	self assert: history undoCollection size equals: 2.
	self assert: (history undoCollection at: 1) undoMemento size equals: 3.
	self assert: (history undoCollection at: 2) undoMemento size equals: 4.
	self assert: history redoCollection size equals: 2.
	self assert: (history redoCollection at: 1) redoMemento size equals: 2.
	self assert: (history redoCollection at: 2) redoMemento size equals: 1.

	history redo.
	history redo.
	self assert: history undoCollection size equals: 4.
	self assert: (history undoCollection at: 1) undoMemento size equals: 1.
	self assert: (history undoCollection at: 2) undoMemento size equals: 2.
	self assert: (history undoCollection at: 3) undoMemento size equals: 3.
	self assert: (history undoCollection at: 4) undoMemento size equals: 4.
	self assert: history redoCollection isEmpty.

	"Three undos"

	history undo.
	history undo.
	history undo.
	self assert: history undoCollection size equals: 1.
	self assert: (history undoCollection at: 1) undoMemento size equals: 4.
	self assert: history redoCollection size equals: 3.
	self assert: (history redoCollection at: 1) redoMemento size equals: 3.
	self assert: (history redoCollection at: 2) redoMemento size equals: 2.
	self assert: (history redoCollection at: 3) redoMemento size equals: 1.

	history redo.
	history redo.
	history redo.
	self assert: history undoCollection size equals: 4.
	self assert: (history undoCollection at: 1) undoMemento size equals: 1.
	self assert: (history undoCollection at: 2) undoMemento size equals: 2.
	self assert: (history undoCollection at: 3) undoMemento size equals: 3.
	self assert: (history undoCollection at: 4) undoMemento size equals: 4.
	self assert: history redoCollection isEmpty.

	"Four undos"

	history undo.
	history undo.
	history undo.
	history undo.
	self assert: history undoCollection isEmpty.
	self assert: history redoCollection size equals: 4.
	self assert: (history redoCollection at: 1) redoMemento size equals: 4.
	self assert: (history redoCollection at: 2) redoMemento size equals: 3.
	self assert: (history redoCollection at: 3) redoMemento size equals: 2.
	self assert: (history redoCollection at: 4) redoMemento size equals: 1.

	history redo.
	history redo.
	history redo.
	history redo.
	self assert: history undoCollection size equals: 4.
	self assert: (history undoCollection at: 1) undoMemento size equals: 1.
	self assert: (history undoCollection at: 2) undoMemento size equals: 2.
	self assert: (history undoCollection at: 3) undoMemento size equals: 3.
	self assert: (history undoCollection at: 4) undoMemento size equals: 4.
	self assert: history redoCollection isEmpty
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
	self assert: history undoCollection size equals: 1.
	self useCommandWith: 2.
	self assert: history undoCollection size equals: 2.
	self useCommandWith: 3.
	self assert: history undoCollection size equals: 3.
	history undo.
	history undo.
	history undo.
	self assert: history undoCollection size equals: 0.
	history redo.
	history redo.
	history redo.
	self assert: history undoCollection size equals: 3
]

{ #category : #'as yet unclassified' }
PyramidHistoryTest >> useCommandWith: anArgument [

	self useCommandWith: anArgument onTarget: dummys
]

{ #category : #'as yet unclassified' }
PyramidHistoryTest >> useCommandWith: anArgument onTarget: aCollection [

	command state arguments: anArgument.
	targets collection: aCollection.
	pipeline useCommand: command on: targets
]
