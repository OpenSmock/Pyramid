Class {
	#name : #PyramidBasicExactHorizontalConstraintsBlocCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidBasicExactHorizontalConstraintsBlocCommandTest >> command [

	^ PyramidBasicExactHorizontalConstraintsBlocCommand new
]

{ #category : #'as yet unclassified' }
PyramidBasicExactHorizontalConstraintsBlocCommandTest >> targetContainers [

	| p1 a1 b1 p2 a2 b2 |
	p1 := BlElement new
		      layout: BlBasicLayout new;
		      yourself.
	a1 := BlElement new.
	b1 := BlElement new constraintsDo: [ :c |
		      c vertical exact: 100.
		      c horizontal exact: 600 ].
	p1 addChildren: { a1.b1 }.

	p2 := BlElement new
		      layout: BlFlowLayout new;
		      yourself.
	a2 := BlElement new.
	b2 := BlElement new constraintsDo: [ :c |
		      c vertical exact: 100.
		      c horizontal exact: 600 ].

	p2 addChildren: {
			a2.
			b2 }.

	^ {
		  (PyramidCommandTestContainer no: a1 with: b1 prop: 600).
		  (PyramidCommandTestContainer no: a2 with: b2 prop: 600) }
]

{ #category : #'as yet unclassified' }
PyramidBasicExactHorizontalConstraintsBlocCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	| parent child |
	child := BlElement new constraintsDo: [ :c | c horizontal matchParent . c vertical fitContent ].
	parent := BlElement new addChild: child.
	^ {
		  nil.
		  false.
		  0.
		  $a.
		  BlElement new.
		child}
]
