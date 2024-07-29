Class {
	#name : #PyramidWeightConstraintsCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidWeightConstraintsCommandTest >> command [

	^ PyramidWeightConstraintsCommand new
]

{ #category : #'as yet unclassified' }
PyramidWeightConstraintsCommandTest >> targetContainers [

	| parentLinear e1Linear e2Linear parentFlow e1Flow e2Flow |
	parentLinear := BlElement new
		          layout: BlLinearLayout new;
		          yourself.
	e1Linear := BlElement new.
	e2Linear := BlElement new constraintsDo: [ :c |
		      c linear weight: 0.5 ].

	parentLinear addChildren: {
			e1Linear.
			e2Linear }.
			
	parentFlow := BlElement new
		          layout: BlLinearLayout new;
		          yourself.
	e1Flow := BlElement new.
	e2Flow := BlElement new constraintsDo: [ :c |
		      c linear weight: 0.5 ].

	parentFlow addChildren: {
			e1Flow.
			e2Flow }.

	^ { (PyramidCommandTestContainer no: e1Linear with: e2Linear prop: 0.5) .  (PyramidCommandTestContainer no: e1Flow with: e2Flow prop: 0.5) }
]

{ #category : #'as yet unclassified' }
PyramidWeightConstraintsCommandTest >> targetsCannotBeUsedFor [
	"override if needed"
	| parent child |
	parent := BlElement new layout: BlFrameLayout new.
	child := BlElement new.
	parent addChild: child.
	^ { nil . false . 0 . $a . BlElement new . child }
]
