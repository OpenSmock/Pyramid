Class {
	#name : #NeoPyramidHistoryTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-cases-history'
}

{ #category : #tests }
NeoPyramidHistoryTest >> testCanRedo [

	| commandExec dummyCommand dummyTarget dummyArguments |
	commandExec := NeoPyramidCommandExecutor new.
	self deny: commandExec history canRedo.

	dummyCommand := NeoPyramidAddMockCommand new.
	dummyTarget := { NeoPyramidMockObjectForTest new }.
	dummyArguments := nil.

	commandExec use: dummyCommand on: dummyTarget with: dummyArguments.

	self deny: commandExec history canRedo.
	commandExec history undo.
	self assert: commandExec history canRedo.
		commandExec history redo.
		self deny: commandExec history canRedo.
	
]

{ #category : #tests }
NeoPyramidHistoryTest >> testCanUndo [

	| commandExec dummyCommand dummyTarget dummyArguments |
	commandExec := NeoPyramidCommandExecutor new.
	self deny: commandExec history canUndo.

	dummyCommand := NeoPyramidAddMockCommand new.
	dummyTarget := { NeoPyramidMockObjectForTest new }.
	dummyArguments := nil.

	commandExec use: dummyCommand on: dummyTarget with: dummyArguments.

	self assert: commandExec history canUndo.
	commandExec history undo.
	self deny: commandExec history canUndo
]

{ #category : #tests }
NeoPyramidHistoryTest >> testRedo [

	| commandExec dummyCommand dummyTarget dummyArguments |
	commandExec := NeoPyramidCommandExecutor new.
	dummyCommand := NeoPyramidAddMockCommand new.
	dummyTarget := { NeoPyramidMockObjectForTest new }.
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
	self assert: dummyTarget first count equals: 0.
	
	commandExec history redo.
	self assert: dummyTarget first count equals: 1.
	commandExec history redo.
	self assert: dummyTarget first count equals: 2.
	commandExec history redo.
	self assert: dummyTarget first count equals: 3
]

{ #category : #tests }
NeoPyramidHistoryTest >> testUndo [

	| commandExec dummyCommand dummyTarget dummyArguments |
	commandExec := NeoPyramidCommandExecutor new.
	dummyCommand := NeoPyramidAddMockCommand new.
	dummyTarget := { NeoPyramidMockObjectForTest new }.
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
	self assert: dummyTarget first count equals: 0.
]
