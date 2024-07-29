Class {
	#name : #PyramidProportionnalHorizontalConstraintsCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidProportionnalHorizontalConstraintsCommandTest >> command [

	^ PyramidProportionnalHorizontalConstraintsCommand new
]

{ #category : #'as yet unclassified' }
PyramidProportionnalHorizontalConstraintsCommandTest >> targetContainers [

	| parent e1 e2 |
	parent := BlElement new layout: BlProportionalLayout new; yourself.
	e1 := BlElement new.
	e2 := BlElement new constraintsDo: [ :c | c proportional vertical top: 0.3; bottom: 0.6.
		c proportional horizontal left: 0.2; right: 0.4 ]
		.
	
	parent addChildren: { e1 . e2 }.

	^ {
		  (PyramidCommandTestContainer
			   no: e1
			   with: e2
			   prop: 0.2 @ 0.4)}
]

{ #category : #'as yet unclassified' }
PyramidProportionnalHorizontalConstraintsCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	^ { nil. false. 0. $a .
		  BlElement new}
]
