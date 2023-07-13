Class {
	#name : #NeoPyramidCommandTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-tests'
}

{ #category : #tests }
NeoPyramidCommandTest >> testClusterOf [
]

{ #category : #tests }
NeoPyramidCommandTest >> testSaveStatesOf [

	| mocks mementos |
	"single element + simple command"
	mocks := { NeoPyramidMockObjectForTest new }.

	mementos := NeoPyramidSimpleMockCommand new saveStatesOf: mocks.
	self assert: mementos class equals: NeoPyramidCommandMemento.
	self assert: mementos target equals: mocks first.
	self assert: mementos command class equals: NeoPyramidSimpleMockCommand.
	self assert: mementos arguments equals: 0.
	
	"multi elements + simple command"
	mocks := { NeoPyramidMockObjectForTest new . NeoPyramidMockObjectForTest new count: 1; yourself }.

	mementos := NeoPyramidSimpleMockCommand new saveStatesOf: mocks.
	self assert: mementos class equals: NeoPyramidCompositeMemento.
	self assert: mementos mementos first class equals: NeoPyramidCommandMemento.
	self assert: mementos mementos first target equals: mocks first.
	self assert: mementos mementos first command class equals: NeoPyramidSimpleMockCommand.
	self assert: mementos mementos first arguments equals: 0.
	self assert: mementos mementos second class equals: NeoPyramidCommandMemento.
	self assert: mementos mementos second target equals: mocks second.
	self assert: mementos mementos second command class equals: NeoPyramidSimpleMockCommand.
	self assert: mementos mementos second arguments equals: 1.
	
	"single element + complexe command"
	mocks := { NeoPyramidMockObjectForTest new }.

	mementos := NeoPyramidAddMockCommand new saveStatesOf: mocks.
	self assert: mementos class equals: NeoPyramidCommandMemento.
	self assert: mementos target equals: mocks first.
	self assert: mementos command class equals: NeoPyramidRemoveMockCommand.
	self assert: mementos arguments equals: nil.
	
	"multi elements + complexe command"
	mocks := { NeoPyramidMockObjectForTest new . NeoPyramidMockObjectForTest new count: 1; yourself }.

	mementos := NeoPyramidAddMockCommand new saveStatesOf: mocks.
	self assert: mementos class equals: NeoPyramidCompositeMemento.
	self assert: mementos mementos first class equals: NeoPyramidCommandMemento.
	self assert: mementos mementos first target equals: mocks first.
	self assert: mementos mementos first command class equals: NeoPyramidRemoveMockCommand.
	self assert: mementos mementos first arguments equals: nil.
	self assert: mementos mementos second class equals: NeoPyramidCommandMemento.
	self assert: mementos mementos second target equals: mocks second.
	self assert: mementos mementos second command class equals: NeoPyramidRemoveMockCommand.
	self assert: mementos mementos second arguments equals: nil.
]

{ #category : #tests }
NeoPyramidCommandTest >> testUseOnWith [

	| mocks |
	mocks := {
		         NeoPyramidMockObjectForTest new.
		         NeoPyramidMockObjectForTest new.
		         NeoPyramidMockObjectForTest new }.

	mocks do: [ :mock | self assert: mock count equals: 0 ].

	NeoPyramidSimpleMockCommand new useOn: mocks with: 5.

	mocks do: [ :mock | self assert: mock count equals: 5 ]
]
