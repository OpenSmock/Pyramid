Class {
	#name : #NeoPyramidCommandTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-cases-command'
}

{ #category : #tests }
NeoPyramidCommandTest >> testClusterOf [

	| mocks cluster |
	"0 element"
	mocks := {  }.
	cluster := NeoPyramidSimpleMockCommand new clusterOf: mocks.

	self assert: cluster isEmpty.
	self deny: cluster isTargetsSameArguments.
	self assert: cluster allTargets isEmpty.
	self assert: cluster arguments isEmpty.
	self assert: cluster groupedAssociations isEmpty.
	self assert: cluster individualAssociations isEmpty.

	"1 element"
	mocks := { (NeoPyramidMockObjectForTest new
		          count: 2;
		          yourself) }.
	cluster := NeoPyramidSimpleMockCommand new clusterOf: mocks.
	self deny: cluster isEmpty.
	self assert: cluster isTargetsSameArguments.
	self assert: cluster allTargets size equals: 1.
	self assert: (cluster allTargets includes: mocks first).
	self assert: cluster arguments size equals: 1.
	self assert: cluster arguments first equals: 2.
	self assert: cluster groupedAssociations size equals: 1.
	self assert: cluster groupedAssociations keys first equals: 2.
	self assert: (cluster groupedAssociations values first includes:  mocks first).
	self assert: cluster individualAssociations size equals: 1.
	self assert: cluster individualAssociations first key equals: 2.
	self assert: (cluster individualAssociations first value includes:  mocks first).


	"n element same value"
	mocks := {
		         (NeoPyramidMockObjectForTest new
			          count: 2;
			          yourself).
		         (NeoPyramidMockObjectForTest new
			          count: 2;
			          yourself).
		         (NeoPyramidMockObjectForTest new
			          count: 2;
			          yourself) }.
	cluster := NeoPyramidSimpleMockCommand new clusterOf: mocks.
	self deny: cluster isEmpty.
	self assert: cluster isTargetsSameArguments.
	self assert: cluster allTargets size equals: 3.
	self assert: (cluster allTargets includes: mocks first).
	self assert: (cluster allTargets includes: mocks second).
	self assert: (cluster allTargets includes: mocks third).
	self assert: cluster arguments size equals: 1.
	self assert: cluster arguments first equals: 2.
	self assert: cluster groupedAssociations size equals: 1.
	self assert: cluster groupedAssociations keys first equals: 2.
	self assert: (cluster groupedAssociations values first includes: mocks first).
	self assert: (cluster groupedAssociations values first includes: mocks second).
	self assert: (cluster groupedAssociations values first includes: mocks third).
	self assert: cluster individualAssociations size equals: 3.
	self assert: cluster individualAssociations first key equals: 2.
	self assert: cluster individualAssociations second key equals: 2.
	self assert: cluster individualAssociations third key equals: 2.
	cluster individualAssociations do: [ :each | self assert: (mocks anySatisfy: [:mock | each value first = mock and: [each key = mock count]])].

	"n element different values"
	mocks := {
		         (NeoPyramidMockObjectForTest new
			          count: 2;
			          yourself).
		         (NeoPyramidMockObjectForTest new
			          count: 3;
			          yourself).
		         (NeoPyramidMockObjectForTest new
			          count: 2;
			          yourself) }.
	cluster := NeoPyramidSimpleMockCommand new clusterOf: mocks.
	self deny: cluster isEmpty.
	self deny: cluster isTargetsSameArguments.
	self assert: cluster allTargets size equals: 3.
	self assert: (cluster allTargets includes: mocks first).
	self assert: (cluster allTargets includes: mocks second).
	self assert: (cluster allTargets includes: mocks third).
	self assert: cluster arguments size equals: 2.
	self assert: (cluster arguments includes: 2).
	self assert: (cluster arguments includes: 3).
	self assert: cluster groupedAssociations size equals: 2.
	cluster groupedAssociations associationsDo: [ :each | self assert: (mocks anySatisfy: [:mock | each value first = mock and: [each key = mock count]])].
	self assert: cluster individualAssociations size equals: 3.
	cluster individualAssociations do: [ :each | self assert: (mocks anySatisfy: [:mock | each value first = mock and: [each key = mock count]])].

]

{ #category : #tests }
NeoPyramidCommandTest >> testSaveStatesOfWith [

	| mocks mementos |
	"single element + simple command"
	mocks := { NeoPyramidMockObjectForTest new }.

	mementos := NeoPyramidSimpleMockCommand new saveStatesOf: mocks with: nil.
	self assert: mementos class equals: NeoPyramidCommandMemento.
	self assert: mementos target equals: mocks first.
	self
		assert: mementos command class
		equals: NeoPyramidSimpleMockCommand.
	self assert: mementos arguments equals: 0.

	"multi elements + simple command"
	mocks := {
		         NeoPyramidMockObjectForTest new.
		         (NeoPyramidMockObjectForTest new
			          count: 1;
			          yourself) }.

	mementos := NeoPyramidSimpleMockCommand new saveStatesOf: mocks with: nil.
	self assert: mementos class equals: NeoPyramidCompositeMemento.
	self
		assert: mementos mementos first class
		equals: NeoPyramidCommandMemento.
	self assert: mementos mementos first target equals: mocks first.
	self
		assert: mementos mementos first command class
		equals: NeoPyramidSimpleMockCommand.
	self assert: mementos mementos first arguments equals: 0.
	self
		assert: mementos mementos second class
		equals: NeoPyramidCommandMemento.
	self assert: mementos mementos second target equals: mocks second.
	self
		assert: mementos mementos second command class
		equals: NeoPyramidSimpleMockCommand.
	self assert: mementos mementos second arguments equals: 1.

	"single element + complexe command"
	mocks := { NeoPyramidMockObjectForTest new }.

	mementos := NeoPyramidIncreaseMockCommand new saveStatesOf: mocks with: nil.
	self assert: mementos class equals: NeoPyramidCommandMemento.
	self assert: mementos target equals: mocks first.
	self assert: mementos command class equals: NeoPyramidIncreaseMockCommand.
	self assert: mementos arguments equals: nil.

	"multi elements + complexe command"
	mocks := {
		         NeoPyramidMockObjectForTest new.
		         (NeoPyramidMockObjectForTest new
			          count: 1;
			          yourself) }.

	mementos := NeoPyramidIncreaseMockCommand new saveStatesOf: mocks with: nil.
	self assert: mementos class equals: NeoPyramidCompositeMemento.
	self
		assert: mementos mementos first class
		equals: NeoPyramidCommandMemento.
	self assert: mementos mementos first target equals: mocks first.
	self
		assert: mementos mementos first command class
		equals: NeoPyramidIncreaseMockCommand.
	self assert: mementos mementos first arguments equals: nil.
	self
		assert: mementos mementos second class
		equals: NeoPyramidCommandMemento.
	self assert: mementos mementos second target equals: mocks second.
	self
		assert: mementos mementos second command class
		equals: NeoPyramidIncreaseMockCommand.
	self assert: mementos mementos second arguments equals: nil
]

{ #category : #tests }
NeoPyramidCommandTest >> testSaveStatesWithCommandInverseOfWith [

	| mocks mementos |
	"single element + simple command"
	mocks := { NeoPyramidMockObjectForTest new }.

	mementos := NeoPyramidSimpleMockCommand new
		            saveStatesWithCommandInverseOf: mocks  with: nil.
	self assert: mementos class equals: NeoPyramidCommandMemento.
	self assert: mementos target equals: mocks first.
	self
		assert: mementos command class
		equals: NeoPyramidSimpleMockCommand.
	self assert: mementos arguments equals: 0.

	"multi elements + simple command"
	mocks := {
		         NeoPyramidMockObjectForTest new.
		         (NeoPyramidMockObjectForTest new
			          count: 1;
			          yourself) }.

	mementos := NeoPyramidSimpleMockCommand new
		            saveStatesWithCommandInverseOf: mocks with: nil.
	self assert: mementos class equals: NeoPyramidCompositeMemento.
	self
		assert: mementos mementos first class
		equals: NeoPyramidCommandMemento.
	self assert: mementos mementos first target equals: mocks first.
	self
		assert: mementos mementos first command class
		equals: NeoPyramidSimpleMockCommand.
	self assert: mementos mementos first arguments equals: 0.
	self
		assert: mementos mementos second class
		equals: NeoPyramidCommandMemento.
	self assert: mementos mementos second target equals: mocks second.
	self
		assert: mementos mementos second command class
		equals: NeoPyramidSimpleMockCommand.
	self assert: mementos mementos second arguments equals: 1.

	"single element + complexe command"
	mocks := { NeoPyramidMockObjectForTest new }.

	mementos := NeoPyramidIncreaseMockCommand new
		            saveStatesWithCommandInverseOf: mocks with: nil.
	self assert: mementos class equals: NeoPyramidCommandMemento.
	self assert: mementos target equals: mocks first.
	self
		assert: mementos command class
		equals: NeoPyramidDecreaseMockCommand.
	self assert: mementos arguments equals: nil.

	"multi elements + complexe command"
	mocks := {
		         NeoPyramidMockObjectForTest new.
		         (NeoPyramidMockObjectForTest new
			          count: 1;
			          yourself) }.

	mementos := NeoPyramidIncreaseMockCommand new
		            saveStatesWithCommandInverseOf: mocks with: nil.
	self assert: mementos class equals: NeoPyramidCompositeMemento.
	self
		assert: mementos mementos first class
		equals: NeoPyramidCommandMemento.
	self assert: mementos mementos first target equals: mocks first.
	self
		assert: mementos mementos first command class
		equals: NeoPyramidDecreaseMockCommand.
	self assert: mementos mementos first arguments equals: nil.
	self
		assert: mementos mementos second class
		equals: NeoPyramidCommandMemento.
	self assert: mementos mementos second target equals: mocks second.
	self
		assert: mementos mementos second command class
		equals: NeoPyramidDecreaseMockCommand.
	self assert: mementos mementos second arguments equals: nil
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
