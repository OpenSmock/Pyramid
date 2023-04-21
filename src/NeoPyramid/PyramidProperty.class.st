Class {
	#name : #PyramidProperty,
	#superclass : #Object,
	#instVars : [
		'command',
		'pipeline',
		'targetModel',
		'inputModel',
		'inputBuilder'
	],
	#category : #'NeoPyramid-plugin-properties'
}

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

{ #category : #accessing }
PyramidProperty >> inputModel [
	^ inputModel
]

{ #category : #accessing }
PyramidProperty >> inputModel: anObject [

	inputModel := anObject
]

{ #category : #'as yet unclassified' }
PyramidProperty >> pipeline [

	^ pipeline.
]

{ #category : #accessing }
PyramidProperty >> pipeline: anObject [

	pipeline := anObject
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
