Class {
	#name : #PyramidPropertyTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-Tests-Cases'
}

{ #category : #tests }
PyramidPropertyTest >> testSubmitOn [

	| property command elements boolean |
	boolean := true.
	command := PyramidCommand
		           set: [ :state :target | target add: state arguments ]
		           get: [ :state :obj |
			           state source: obj.
			           state arguments: boolean.
			           boolean := boolean not ]
		           isExecutableBlock: [ :obj :state | true ].
	property := PyramidProperty new
		            command: command;
		            pipeline: PyramidPipeline new;
		            yourself.

	property updateTargetModelFrom: {
			(OrderedCollection new
				 add: $a;
				 yourself).
			(OrderedCollection new
				 add: $b;
				 yourself).
			(OrderedCollection new
				 add: $c;
				 yourself).
			(OrderedCollection new
				 add: $d;
				 yourself) }.
	elements := property targetModel targets.
	self assert: elements size equals: 4.
	self assert: (elements allSatisfy: [ :each | each size = 1 ]).
	property submit: $e on: elements.
	self assert: elements size equals: 4.
	self assert:
		(elements allSatisfy: [ :each |
			 each size = 2 and: [ each last = $e ] ])
]

{ #category : #tests }
PyramidPropertyTest >> testUpdateTargetModelFrom [

	| property command |
	command := PyramidCommand
		           set: [ :s :t |  ]
		           get: [ :state :obj |
			           state source: obj.
			           state arguments: obj even ]
		           isExecutableBlock: [ :obj :state | obj < 5 ].
	property := PyramidProperty new command: command.
	property updateTargetModelFrom: { 1. 2. 3. 4. 5. 6. 7. 8. 9. 10 }.

	self assert: property targetModel targets size equals: 4.
	self assert:
		(property targetModel targets anySatisfy: [ :e | e = 1 ]).
	self assert:
		(property targetModel targets anySatisfy: [ :e | e = 2 ]).
	self assert:
		(property targetModel targets anySatisfy: [ :e | e = 3 ]).
	self assert:
		(property targetModel targets anySatisfy: [ :e | e = 4 ]).

	self assert: property targetModel argumentsDict keys size equals: 2.
	self assert:
		((property targetModel argumentsDict at: true) anySatisfy: [ :e |
			 e = 2 ]).
	self assert:
		((property targetModel argumentsDict at: true) anySatisfy: [ :e |
			 e = 4 ]).
	self assert:
		((property targetModel argumentsDict at: false) anySatisfy: [ :e |
			 e = 1 ]).
	self assert:
		((property targetModel argumentsDict at: false) anySatisfy: [ :e |
			 e = 3 ]).

	property updateTargetModelFrom: { 5. 6. 7. 8. 9. 10 }.

	self assert: property targetModel targets size equals: 0.
	self assert: property targetModel argumentsDict keys size equals: 0
]
