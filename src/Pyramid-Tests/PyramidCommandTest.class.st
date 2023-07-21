Class {
	#name : #PyramidCommandTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-command'
}

{ #category : #tests }
PyramidCommandTest >> testClusterOf [

	| mocks cluster |
	"0 element"
	mocks := {  }.
	cluster := PyramidSimpleMockCommand new clusterOf: mocks.

	self assert: cluster isEmpty.
	self deny: cluster isTargetsSameArguments.
	self assert: cluster allTargets isEmpty.
	self assert: cluster arguments isEmpty.
	self assert: cluster groupedAssociations isEmpty.
	self assert: cluster individualAssociations isEmpty.

	"1 element"
	mocks := { (PyramidMockObjectForTest new
		          count: 2;
		          yourself) }.
	cluster := PyramidSimpleMockCommand new clusterOf: mocks.
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
		         (PyramidMockObjectForTest new
			          count: 2;
			          yourself).
		         (PyramidMockObjectForTest new
			          count: 2;
			          yourself).
		         (PyramidMockObjectForTest new
			          count: 2;
			          yourself) }.
	cluster := PyramidSimpleMockCommand new clusterOf: mocks.
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
		         (PyramidMockObjectForTest new
			          count: 2;
			          yourself).
		         (PyramidMockObjectForTest new
			          count: 3;
			          yourself).
		         (PyramidMockObjectForTest new
			          count: 2;
			          yourself) }.
	cluster := PyramidSimpleMockCommand new clusterOf: mocks.
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
PyramidCommandTest >> testSaveStatesOfWith [

	| mocks mementos |
	"single element + simple command"
	mocks := { PyramidMockObjectForTest new }.

	mementos := PyramidSimpleMockCommand new saveStatesOf: mocks with: nil.
	self assert: mementos class equals: PyramidCommandMemento.
	self assert: mementos target equals: mocks first.
	self
		assert: mementos command class
		equals: PyramidSimpleMockCommand.
	self assert: mementos arguments equals: 0.

	"multi elements + simple command"
	mocks := {
		         PyramidMockObjectForTest new.
		         (PyramidMockObjectForTest new
			          count: 1;
			          yourself) }.

	mementos := PyramidSimpleMockCommand new saveStatesOf: mocks with: nil.
	self assert: mementos class equals: PyramidCompositeMemento.
	self
		assert: mementos mementos first class
		equals: PyramidCommandMemento.
	self assert: mementos mementos first target equals: mocks first.
	self
		assert: mementos mementos first command class
		equals: PyramidSimpleMockCommand.
	self assert: mementos mementos first arguments equals: 0.
	self
		assert: mementos mementos second class
		equals: PyramidCommandMemento.
	self assert: mementos mementos second target equals: mocks second.
	self
		assert: mementos mementos second command class
		equals: PyramidSimpleMockCommand.
	self assert: mementos mementos second arguments equals: 1.

	"single element + complexe command"
	mocks := { PyramidMockObjectForTest new }.

	mementos := PyramidIncreaseMockCommand new saveStatesOf: mocks with: nil.
	self assert: mementos class equals: PyramidCommandMemento.
	self assert: mementos target equals: mocks first.
	self assert: mementos command class equals: PyramidIncreaseMockCommand.
	self assert: mementos arguments equals: nil.

	"multi elements + complexe command"
	mocks := {
		         PyramidMockObjectForTest new.
		         (PyramidMockObjectForTest new
			          count: 1;
			          yourself) }.

	mementos := PyramidIncreaseMockCommand new saveStatesOf: mocks with: nil.
	self assert: mementos class equals: PyramidCompositeMemento.
	self
		assert: mementos mementos first class
		equals: PyramidCommandMemento.
	self assert: mementos mementos first target equals: mocks first.
	self
		assert: mementos mementos first command class
		equals: PyramidIncreaseMockCommand.
	self assert: mementos mementos first arguments equals: nil.
	self
		assert: mementos mementos second class
		equals: PyramidCommandMemento.
	self assert: mementos mementos second target equals: mocks second.
	self
		assert: mementos mementos second command class
		equals: PyramidIncreaseMockCommand.
	self assert: mementos mementos second arguments equals: nil
]

{ #category : #tests }
PyramidCommandTest >> testSaveStatesWithCommandInverseOfWith [

	| mocks mementos |
	"single element + simple command"
	mocks := { PyramidMockObjectForTest new }.

	mementos := PyramidSimpleMockCommand new
		            saveStatesWithCommandInverseOf: mocks  with: nil.
	self assert: mementos class equals: PyramidCommandMemento.
	self assert: mementos target equals: mocks first.
	self
		assert: mementos command class
		equals: PyramidSimpleMockCommand.
	self assert: mementos arguments equals: 0.

	"multi elements + simple command"
	mocks := {
		         PyramidMockObjectForTest new.
		         (PyramidMockObjectForTest new
			          count: 1;
			          yourself) }.

	mementos := PyramidSimpleMockCommand new
		            saveStatesWithCommandInverseOf: mocks with: nil.
	self assert: mementos class equals: PyramidCompositeMemento.
	self
		assert: mementos mementos first class
		equals: PyramidCommandMemento.
	self assert: mementos mementos first target equals: mocks first.
	self
		assert: mementos mementos first command class
		equals: PyramidSimpleMockCommand.
	self assert: mementos mementos first arguments equals: 0.
	self
		assert: mementos mementos second class
		equals: PyramidCommandMemento.
	self assert: mementos mementos second target equals: mocks second.
	self
		assert: mementos mementos second command class
		equals: PyramidSimpleMockCommand.
	self assert: mementos mementos second arguments equals: 1.

	"single element + complexe command"
	mocks := { PyramidMockObjectForTest new }.

	mementos := PyramidIncreaseMockCommand new
		            saveStatesWithCommandInverseOf: mocks with: nil.
	self assert: mementos class equals: PyramidCommandMemento.
	self assert: mementos target equals: mocks first.
	self
		assert: mementos command class
		equals: PyramidDecreaseMockCommand.
	self assert: mementos arguments equals: nil.

	"multi elements + complexe command"
	mocks := {
		         PyramidMockObjectForTest new.
		         (PyramidMockObjectForTest new
			          count: 1;
			          yourself) }.

	mementos := PyramidIncreaseMockCommand new
		            saveStatesWithCommandInverseOf: mocks with: nil.
	self assert: mementos class equals: PyramidCompositeMemento.
	self
		assert: mementos mementos first class
		equals: PyramidCommandMemento.
	self assert: mementos mementos first target equals: mocks first.
	self
		assert: mementos mementos first command class
		equals: PyramidDecreaseMockCommand.
	self assert: mementos mementos first arguments equals: nil.
	self
		assert: mementos mementos second class
		equals: PyramidCommandMemento.
	self assert: mementos mementos second target equals: mocks second.
	self
		assert: mementos mementos second command class
		equals: PyramidDecreaseMockCommand.
	self assert: mementos mementos second arguments equals: nil
]

{ #category : #tests }
PyramidCommandTest >> testUseOnWith [

	| mocks |
	mocks := {
		         PyramidMockObjectForTest new.
		         PyramidMockObjectForTest new.
		         PyramidMockObjectForTest new }.

	mocks do: [ :mock | self assert: mock count equals: 0 ].

	PyramidSimpleMockCommand new useOn: mocks with: 5.

	mocks do: [ :mock | self assert: mock count equals: 5 ]
]
