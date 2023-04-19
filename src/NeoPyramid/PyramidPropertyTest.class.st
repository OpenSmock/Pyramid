Class {
	#name : #PyramidPropertyTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #tests }
PyramidPropertyTest >> testSubmitOnElement [

	| property command element |
	command := PyramidCommand
		           set: [ :state :target | target add: state arguments ]
		           get: [ :state :obj | ]
		           isExecutableBlock: [ :obj | true ].
	property := PyramidProperty new
		            command: command;
		            pipeline: PyramidPipeline new;
		            yourself.
	element := OrderedCollection new.
	self assert: element size equals: 0.
	property submit: $a onElement: element.
	self assert: element size equals: 1.
	self assert: element first equals: $a.
	
]

{ #category : #tests }
PyramidPropertyTest >> testSubmitOnModel [

	| property command elements boolean|
	boolean := true.
	command := PyramidCommand
		           set: [ :state :target | target add: state arguments ]
		           get: [ :state :obj |
			           state source: obj.
			           state arguments: boolean.
			boolean := boolean not ]
		           isExecutableBlock: [ :obj | true ].
	property := PyramidProperty new
		            command: command;
		            pipeline: PyramidPipeline new;
		            yourself.

	property updateModelFrom: {
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
	elements := property model states flatCollect: [ :state |
		            state source ].
	self assert: elements size equals: 4.
	self assert: (elements allSatisfy: [ :each | each size = 1 ]).
	property submitOnModel: $e.
	self assert: elements size equals: 4.
	self assert:
		(elements allSatisfy: [ :each |
			 each size = 2 and: [ each last = $e ] ])
]

{ #category : #tests }
PyramidPropertyTest >> testSubmitOnState [

	| property command elements boolean |
	boolean := true.
	command := PyramidCommand
		           set: [ :state :target | target add: state arguments ]
		           get: [ :state :obj |
			           state source: obj.
			           state arguments: boolean.
			           boolean := boolean not ]
		           isExecutableBlock: [ :obj | true ].
	property := PyramidProperty new
		            command: command;
		            pipeline: PyramidPipeline new;
		            yourself.

	property updateModelFrom: {
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
	elements := property model states flatCollect: [ :state |
		            state source ].
	self assert: elements size equals: 4.
	self assert: (elements allSatisfy: [ :each | each size = 1 ]).
	property
		submit: $e
		onState: (property model states select: [ :each | each arguments ]) first.
	self assert: elements size equals: 4.
	self assert: (((property model states select: [ :each | each arguments ]) first source)
		 allSatisfy: [ :each |
			 each size = 2 and: [ each last = $e ] ]).
		self assert: (((property model states reject: [ :each | each arguments ]) first source)
		 allSatisfy: [ :each |
			 each size = 1 ])
]

{ #category : #tests }
PyramidPropertyTest >> testTargetsFromCollection [

	| property command result rTrue rFalse |
	command := PyramidCommand
		           set: [ :s :t |  ]
		           get: [ :state :obj |
			           state source: obj.
			           state arguments: obj even ]
		           isExecutableBlock: [ :obj | obj < 5 ].
	property := PyramidProperty new command: command.
	result := property targetsFromCollection:
		          { 1. 2. 3. 4. 5. 6. 7. 8. 9. 10 }.
	rTrue := (result select: [ :each | each arguments ]) first.
	rFalse := (result reject: [ :each | each arguments ]) first.
	self assert: result size equals: 2.
	self assert: rTrue source size equals: 2.
	self assert: (rTrue source at: 1) equals: 2.
	self assert: (rTrue source at: 2) equals: 4.
	self assert: rFalse source size equals: 2.
	self assert: (rFalse source at: 1) equals: 1.
	self assert: (rFalse source at: 2) equals: 3
]

{ #category : #tests }
PyramidPropertyTest >> testUpdateModelFrom [

	| property command result elements  |
	command := PyramidCommand
		           set: [ :s :t |  ]
		           get: [ :state :obj |
			           state source: obj.
			           state arguments: obj even ]
		           isExecutableBlock: [ :obj | obj < 5 ].
	property := PyramidProperty new command: command.
	
	elements := property model allElements.
	self assert: elements size equals: 0.
	
	result := property updateModelFrom:
		          { 1. 2. 3. 4. 5. 6. 7. 8. 9. 10 }.
	elements := property model allElements.
	self assert: elements size equals: 4.
	self assert: (elements anySatisfy: [ :each | each = 1 ]).
	self assert: (elements anySatisfy: [ :each | each = 2 ]).
	self assert: (elements anySatisfy: [ :each | each = 3 ]).
	self assert: (elements anySatisfy: [ :each | each = 4 ]).
]
