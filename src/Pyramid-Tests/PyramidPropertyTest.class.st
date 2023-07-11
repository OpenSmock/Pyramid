Class {
	#name : #PyramidPropertyTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-properties'
}

{ #category : #tests }
PyramidPropertyTest >> testSubmitOn [

	| property command elements boolean |
	boolean := true.
	command := PyramidCommand
		           set: [ :state :target | target string: state arguments ]
		           get: [ :state :obj |
			           state source: obj.
			           state arguments: boolean.
			           boolean := boolean not ]
		           isExecutableBlock: [ :obj :state | true ].
	property := PyramidProperty new
		            command: command;
		            pipeline: PyramidPipeline new;
						inputBuilder: PyramidDummyBuilder new;
		            yourself.

	elements := {
			(PyramidPropertiesTestDummy new
				 string: 'aaaa';
				 yourself).
			(PyramidPropertiesTestDummy new
				 string: 'aaaa';
				 yourself).
			(PyramidPropertiesTestDummy new
				 string: 'aaaa';
				 yourself).
			(PyramidPropertiesTestDummy new
				 string: 'aaaa';
				 yourself) }.
				
	property makeNewInputsFor: elements.			
	
	self assert: (elements allSatisfy: [ :each | each string = 'aaaa' ]).
	property submit: 'bbbb' on: elements.
	self assert:
		(elements allSatisfy: [ :each |
			 each string = 'bbbb' ])
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
