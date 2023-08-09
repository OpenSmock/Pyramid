Class {
	#name : #PyramidProportionnalVerticalConstraintsCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidProportionnalVerticalConstraintsCommandTest >> command [

	^ PyramidProportionnalVerticalConstraintsCommand new
]

{ #category : #'as yet unclassified' }
PyramidProportionnalVerticalConstraintsCommandTest >> targetContainers [

	| parent e1 e2 |
	parent := BlElement new
		          layout: BlProportionalLayout new;
		          yourself.
	e1 := BlElement new.
	e2 := BlElement new constraintsDo: [ :c |
		      c proportional vertical
			      top: 0.3;
			      bottom: 0.6.
		      c proportional horizontal
			      left: 0.2;
			      right: 0.4 ].

	parent addChildren: {
			e1.
			e2 }.

	^ { (PyramidCommandTestContainer no: e1 with: e2 prop: 0.3 @ 0.6) }
]

{ #category : #'as yet unclassified' }
PyramidProportionnalVerticalConstraintsCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	^ { nil. false. 0. $a . BlElement new}
]
