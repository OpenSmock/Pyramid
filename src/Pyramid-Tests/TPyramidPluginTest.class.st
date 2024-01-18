Class {
	#name : #TPyramidPluginTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #tests }
TPyramidPluginTest >> testAllSubsDependencies [

	| plugin read |
	plugin := PyramidFakePluginA new.
	plugin class slotNamed: #allSubsDependencies ifFound: [ :slot | read := slot read: plugin ].
	self assert: read isNil.
	self assert: plugin allSubsDependencies equals: { PyramidFakePluginA }.
	plugin class slotNamed: #allSubsDependencies ifFound: [ :slot | read := slot write: 123 to: plugin ].
	self assert: plugin allSubsDependencies equals: 123
]

{ #category : #tests }
TPyramidPluginTest >> testCheckDependenciesWith [

	| pluginA pluginB pluginC error |
	pluginA := PyramidFakePluginA new.
	pluginB := PyramidFakePluginB new.
	pluginC := PyramidFakePluginC new.

	[ pluginA checkDependenciesWith: { pluginA } ]
		on: PyramidPluginNotFoundError
		do: [ self fail ].
	[
	pluginA checkDependenciesWith: {
			pluginA.
			pluginB.
			pluginC } ]
		on: PyramidPluginNotFoundError
		do: [ self fail ].
	[
	pluginB checkDependenciesWith: {
			pluginA.
			pluginB } ]
		on: PyramidPluginNotFoundError
		do: [ self fail ].
	[
	pluginB checkDependenciesWith: {
			pluginA.
			pluginB.
			pluginC } ]
		on: PyramidPluginNotFoundError
		do: [ self fail ].
	[
	pluginC checkDependenciesWith: {
			pluginA.
			pluginB.
			pluginC } ]
		on: PyramidPluginNotFoundError
		do: [ self fail ].
		
	"With errors"
	error := false.
	[ pluginA checkDependenciesWith: { } ]
		on: PyramidPluginNotFoundError
		do: [ error := true ].
	self assert: error.
	error := false.
	[
	pluginC checkDependenciesWith: {
			pluginB.
			pluginC } ]
		on: PyramidPluginNotFoundError
		do: [ error := true ].
		self assert: error.
]

{ #category : #tests }
TPyramidPluginTest >> testComputeAllSubsDependencies [

	| dependencies |
	dependencies := PyramidFakePluginA new computeAllSubsDependencies.
	self assert: dependencies size equals: 1.
	self assert: (dependencies includes: PyramidFakePluginA).

	dependencies := PyramidFakePluginB new computeAllSubsDependencies.
	self assert: dependencies size equals: 2.
	self assert: (dependencies includes: PyramidFakePluginB).
	self assert: (dependencies includes: PyramidFakePluginA).
	
	dependencies := PyramidFakePluginG new computeAllSubsDependencies.
	self assert: dependencies size equals: 8.
	self assert: (dependencies includes: PyramidFakePluginG).
	self assert: (dependencies includes: PyramidFakePluginF).
	self assert: (dependencies includes: PyramidFakePluginE).
	self assert: (dependencies includes: PyramidFakePluginD).
	self assert: (dependencies includes: PyramidFakePluginC).
	self assert: (dependencies includes: PyramidFakePluginB).
	self assert: (dependencies includes: PyramidFakePluginA)
]

{ #category : #tests }
TPyramidPluginTest >> testIsDependentOf [

	self assert:
		(PyramidFakePluginB new isDependentOf: PyramidFakePluginA).
	self assert:
		(PyramidFakePluginC new isDependentOf: PyramidFakePluginA).
	self assert:
		(PyramidFakePluginD new isDependentOf: PyramidFakePluginA).
	self assert:
		(PyramidFakePluginE new isDependentOf: PyramidFakePluginA).
	self assert:
		(PyramidFakePluginF new isDependentOf: PyramidFakePluginA).
	self assert:
		(PyramidFakePluginG new isDependentOf: PyramidFakePluginA).
	self deny: (PyramidFakePluginA new isDependentOf: PyramidFakePluginB).
	self assert:
		(PyramidFakePluginA new isDependentOf: PyramidFakePluginA)
]

{ #category : #tests }
TPyramidPluginTest >> testLessThanOrEqual [

	self assert: PyramidFakePluginA new <= PyramidFakePluginA new.
	self assert: PyramidFakePluginA new <= PyramidFakePluginB new.
	self assert: PyramidFakePluginA new <= PyramidFakePluginC new.
	self assert: PyramidFakePluginA new <= PyramidFakePluginD new.
	self assert: PyramidFakePluginA new <= PyramidFakePluginE new.
	self assert: PyramidFakePluginA new <= PyramidFakePluginF new.
	self assert: PyramidFakePluginA new <= PyramidFakePluginG new.
	
	self assert: PyramidFakePluginB new <= PyramidFakePluginB new.
	self assert: PyramidFakePluginB new <= PyramidFakePluginC new.
	self assert: PyramidFakePluginB new <= PyramidFakePluginD new.
	self assert: PyramidFakePluginB new <= PyramidFakePluginE new.
	self assert: PyramidFakePluginB new <= PyramidFakePluginF new.
	self assert: PyramidFakePluginB new <= PyramidFakePluginG new.
	
self assert: PyramidFakePluginC new <= PyramidFakePluginC new.
	self assert: PyramidFakePluginC new <= PyramidFakePluginD new.
	self assert: PyramidFakePluginC new <= PyramidFakePluginE new.
	self assert: PyramidFakePluginC new <= PyramidFakePluginF new.
	self assert: PyramidFakePluginC new <= PyramidFakePluginG new.
	
self assert: PyramidFakePluginD new <= PyramidFakePluginD new.
	self assert: PyramidFakePluginD new <= PyramidFakePluginE new.
	self assert: PyramidFakePluginD new <= PyramidFakePluginF new.
	self assert: PyramidFakePluginD new <= PyramidFakePluginG new.
	
self assert: PyramidFakePluginE new <= PyramidFakePluginE new.
	self assert: PyramidFakePluginE new <= PyramidFakePluginF new.
	self assert: PyramidFakePluginE new <= PyramidFakePluginG new.
	
	self assert: PyramidFakePluginF new <= PyramidFakePluginF new.
	self assert: PyramidFakePluginF new <= PyramidFakePluginG new.
	
	self assert: PyramidFakePluginG new <= PyramidFakePluginG new.
]
