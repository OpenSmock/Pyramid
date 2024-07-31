Class {
	#name : #PyramidHistoryTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-history'
}

{ #category : #tests }
PyramidHistoryTest >> testCanRedo [

	| commandExec dummyCommand dummyTarget dummyArguments |
	commandExec := PyramidHistoryCommandExecutor new
							history: PyramidHistory new;
		               wrappee: PyramidMainCommandExecutor new;
		               yourself.
	self deny: commandExec history canRedo.

	dummyCommand := PyramidIncreaseMockCommand new.
	dummyTarget := { PyramidMockObjectForTest new }.
	dummyArguments := nil.

	commandExec use: dummyCommand on: dummyTarget with: dummyArguments.

	self deny: commandExec history canRedo.
	commandExec history undo.
	self assert: commandExec history canRedo.
	commandExec history redo.
	self deny: commandExec history canRedo
]

{ #category : #tests }
PyramidHistoryTest >> testCanUndo [

	| commandExec dummyCommand dummyTarget dummyArguments |
	commandExec := PyramidHistoryCommandExecutor new
	history: PyramidHistory new;
		               wrappee: PyramidMainCommandExecutor new;
		               yourself.
	self deny: commandExec history canUndo.

	dummyCommand := PyramidIncreaseMockCommand new.
	dummyTarget := { PyramidMockObjectForTest new }.
	dummyArguments := nil.

	commandExec use: dummyCommand on: dummyTarget with: dummyArguments.

	self assert: commandExec history canUndo.
	commandExec history undo.
	self deny: commandExec history canUndo
]

{ #category : #tests }
PyramidHistoryTest >> testCollectionHistory [
	"
	<collection>

	collection add: 1 to 100
	collection remove: 91 to 100
	undo 10 times (collection: 1 to 100)
	collection add: 101 to 200 (collection: 1 to 200)
	undo 200 times (collection empty)
	redo 200 times (collection: 1 to 200)
	"

	| commandExec dummyCommand dummyTarget collection |
	collection := Bag new.
	commandExec := PyramidHistoryCommandExecutor new
	history: PyramidHistory new;
		               wrappee: PyramidMainCommandExecutor new;
		               yourself.
	dummyCommand := PyramidAddToCollectionCommand new.
	dummyTarget := { collection }.

	self assert: collection isEmpty.

	1 to: 100 do: [ :i |
		commandExec
			use: PyramidAddToCollectionCommand new
			on: dummyTarget
			with: i ].
	self assert: collection size equals: 100.
	1 to: 100 do: [ :i | self assert: (collection includes: i) ].

	91 to: 100 do: [ :i |
		commandExec
			use: PyramidRemoveFromCollectionCommand new
			on: dummyTarget
			with: i ].
	self assert: collection size equals: 90.
	1 to: 90 do: [ :i | self assert: (collection includes: i) ].

	1 to: 10 do: [ :i | commandExec history undo ].
	self assert: collection size equals: 100.
	1 to: 100 do: [ :i | self assert: (collection includes: i) ].

	101 to: 200 do: [ :i |
		commandExec
			use: PyramidAddToCollectionCommand new
			on: dummyTarget
			with: i ].
	self assert: collection size equals: 200.
	1 to: 200 do: [ :i | self assert: (collection includes: i) ].

	1 to: 200 do: [ :i | commandExec history undo ].
	self assert: collection isEmpty.
	1 to: 200 do: [ :i | commandExec history redo ].
	self assert: collection size equals: 200.
	1 to: 200 do: [ :i | self assert: (collection includes: i) ]
]

{ #category : #tests }
PyramidHistoryTest >> testRedo [

	| commandExec dummyTarget |
	commandExec := PyramidHistoryCommandExecutor new
	history: PyramidHistory new;
		               wrappee: PyramidMainCommandExecutor new;
		               yourself.
	dummyTarget := { PyramidMockObjectForTest new }.
	self assert: dummyTarget first count equals: 0.

	commandExec
		use: PyramidSimpleMockCommand new
		on: dummyTarget
		with: 10.
	self assert: dummyTarget first count equals: 10.
	commandExec
		use: PyramidSimpleMockCommand new
		on: dummyTarget
		with: 20.
	self assert: dummyTarget first count equals: 20.
	commandExec
		use: PyramidIncreaseMockCommand new
		on: dummyTarget
		with: nil.
	self assert: dummyTarget first count equals: 21.

	commandExec history undo.
	self assert: dummyTarget first count equals: 20.
	commandExec history undo.
	self assert: dummyTarget first count equals: 10.
	commandExec history undo.
	self assert: dummyTarget first count equals: 0.

	commandExec history redo.
	self assert: dummyTarget first count equals: 10.
	commandExec history redo.
	self assert: dummyTarget first count equals: 20.
	commandExec history redo.
	self assert: dummyTarget first count equals: 21.

	commandExec history undo.
	self assert: dummyTarget first count equals: 20.
	commandExec history undo.
	self assert: dummyTarget first count equals: 10.
	commandExec
		use: PyramidIncreaseMockCommand new
		on: dummyTarget
		with: nil.
	self assert: dummyTarget first count equals: 11.
	self deny: commandExec history canRedo.
	commandExec history undo.
	self assert: dummyTarget first count equals: 10.
	commandExec history undo.
	self assert: dummyTarget first count equals: 0.
	commandExec history redo.
	self assert: dummyTarget first count equals: 10.
	commandExec history redo.
	self assert: dummyTarget first count equals: 11
]

{ #category : #tests }
PyramidHistoryTest >> testUndo [

	| commandExec dummyCommand dummyTarget dummyArguments |
	commandExec := PyramidHistoryCommandExecutor new
	history: PyramidHistory new;
		               wrappee: PyramidMainCommandExecutor new;
		               yourself.
	dummyCommand := PyramidIncreaseMockCommand new.
	dummyTarget := { PyramidMockObjectForTest new }.
	dummyArguments := nil.
	self assert: dummyTarget first count equals: 0.

	commandExec use: dummyCommand on: dummyTarget with: dummyArguments.
	self assert: dummyTarget first count equals: 1.
	commandExec use: dummyCommand on: dummyTarget with: dummyArguments.
	self assert: dummyTarget first count equals: 2.
	commandExec use: dummyCommand on: dummyTarget with: dummyArguments.
	self assert: dummyTarget first count equals: 3.

	commandExec history undo.
	self assert: dummyTarget first count equals: 2.
	commandExec history undo.
	self assert: dummyTarget first count equals: 1.
	commandExec history undo.
	self assert: dummyTarget first count equals: 0
]
