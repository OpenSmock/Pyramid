Class {
	#name : #PyramidProperty,
	#superclass : #Object,
	#instVars : [
		'command',
		'model',
		'pipeline',
		'presenter',
		'inputBuilder'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidProperty class >> identifier [

	| property |
	property := self new.
	property
		command: PyramidCommand identifier;
		presenter: (PyramidPropertyInputDeprecated new
				 inputBuilder: (PyramidInputBuilderDeprecated string: property);
				 yourself);
		pipeline: PyramidPipeline new.
	^ property
]

{ #category : #accessing }
PyramidProperty >> command [

	^ command
]

{ #category : #accessing }
PyramidProperty >> command: anObject [

	command := anObject
]

{ #category : #'as yet unclassified' }
PyramidProperty >> initialize [

	model := PyramidPropertyModel new.
]

{ #category : #accessing }
PyramidProperty >> inputBuilder [ 

	^ inputBuilder
]

{ #category : #accessing }
PyramidProperty >> inputBuilder: anObject [

	inputBuilder := anObject
]

{ #category : #'as yet unclassified' }
PyramidProperty >> model [
^ model
]

{ #category : #'as yet unclassified' }
PyramidProperty >> pipeline [

	^ pipeline.
]

{ #category : #accessing }
PyramidProperty >> pipeline: anObject [

	pipeline := anObject
]

{ #category : #accessing }
PyramidProperty >> presenter [

	^ presenter
]

{ #category : #accessing }
PyramidProperty >> presenter: anObject [

	presenter := anObject.
	presenter model: self model.
]

{ #category : #'as yet unclassified' }
PyramidProperty >> stateOf: anObject [

	^ (self command getStateFrom: anObject)
		  source: (OrderedCollection new add: anObject; yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidProperty >> submit: anArguments on: aCollection [

	self command state arguments: anArguments.
	self pipeline useCommand: self command on: (PyramidPipelineTarget new collection: aCollection)
]

{ #category : #'as yet unclassified' }
PyramidProperty >> submit: anArguments onElement: anElement [

	self submit: anArguments on: { anElement }
]

{ #category : #'as yet unclassified' }
PyramidProperty >> submit: anArguments onState: aState [

	self submit: anArguments on: aState source
]

{ #category : #'as yet unclassified' }
PyramidProperty >> submitOnModel: anArguments [

	self submit: anArguments on: self model allElements
]

{ #category : #'as yet unclassified' }
PyramidProperty >> targetsFromCollection: aCollection [

	| states targets |
	targets := aCollection select: [ :each |
		           self command isExecutableBy: each ].

	states := OrderedCollection new.
	targets do: [ :each |
		| newState current |
		newState := self stateOf: each.
		current := states select: [ :state |
			           state arguments = newState arguments ].
		current
			ifEmpty: [ states add: newState ]
			ifNotEmpty: [ current first source addAll: newState source ] ].
	^ states
]

{ #category : #'as yet unclassified' }
PyramidProperty >> updateModelFrom: aCollection [

self model states: (self targetsFromCollection: aCollection)
]
