Class {
	#name : #PyramidProperty,
	#superclass : #Object,
	#classTraits : 'TPyramidPipelineObserver classTrait',
	#instVars : [
		'command',
		'pipeline',
		'targetModel',
		'inputBuilder'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidProperty class >> fromCommand: aPyramidCommand inputBuilder: aPyramidPropertyInputModelBuilderFactory [

	| property |
	property := self new
		            command: aPyramidCommand;
		            yourself.
	aPyramidPropertyInputModelBuilderFactory installBuilderOn: property.
	^ property
]

{ #category : #accessing }
PyramidProperty class >> identifier [

	^ self
		  fromCommand: PyramidCommand identifier
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory identifierTextInput
]

{ #category : #accessing }
PyramidProperty class >> visibility [

	^ self
		  fromCommand: PyramidCommand visibility
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory visibilityDropList
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

	targetModel := PyramidPropertyTargetModel new
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
PyramidProperty >> pipeline [

	^ pipeline.
]

{ #category : #accessing }
PyramidProperty >> pipeline: anObject [

	pipeline := anObject.
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

{ #category : #accessing }
PyramidProperty >> targetModel [
^ targetModel
]

{ #category : #'as yet unclassified' }
PyramidProperty >> updateTargetModelFrom: aCollection [
	self targetModel reset.
	aCollection select: [ :each | self command isExecutableBy: each ] thenDo: [ :each | self targetModel at: (self stateOf: each) arguments put: each ]
]
