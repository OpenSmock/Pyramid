Class {
	#name : #PyramidProperty,
	#superclass : #Object,
	#traits : 'TPyramidProperty',
	#classTraits : 'TPyramidProperty classTrait',
	#instVars : [
		'command',
		'pipeline',
		'targetModel',
		'inputBuilder',
		'inputsModel',
		'order'
	],
	#category : #'Pyramid-properties'
}

{ #category : #accessing }
PyramidProperty class >> fromCommand: aPyramidCommand inputBuilder: aPyramidPropertyInputModelBuilderFactory order: aNumber [

	| property |
	property := self new
		            command: aPyramidCommand;
						order: aNumber;
		            yourself.
	aPyramidPropertyInputModelBuilderFactory installBuilderOn: property.
	^ property
]

{ #category : #sorting }
PyramidProperty class >> sortBlElements: a and: b [

	a parent
	=  b parent ifTrue: [
		^ (a parent childIndexOf: a)
		  <= (a parent childIndexOf:
				   b) ].
	a allParentsDo: [ :p |
		p == b ifTrue: [ ^ false ] ].
	b allParentsDo: [ :p |
		p == a ifTrue: [ ^ true ] ].
	^ a hash
	  <= b hash
]

{ #category : #comparing }
PyramidProperty >> <= aPyramidProperty [

	^ self order <= aPyramidProperty order
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
PyramidProperty >> inputsModel [
	^ inputsModel
]

{ #category : #'as yet unclassified' }
PyramidProperty >> makeNewInputsFor: aCollection [

	self updateTargetModelFrom: aCollection.
	inputsModel := self inputBuilder build.
	self informInputsUpdated.
]

{ #category : #accessing }
PyramidProperty >> order [

	order ifNil: [ order := 100 ].
	^ order
]

{ #category : #accessing }
PyramidProperty >> order: aNumber [

	order := aNumber
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
	"
	Verify the submission does something.
	Use command.
	Update inputs model.
	"

	| previousTargets |
	previousTargets := self targetModel targetsAt: anArguments.
	(aCollection allSatisfy: [ :target |
		 previousTargets anySatisfy: [ :each | each == target ] ]) ifTrue: [
		^ self ].

	self command state arguments: anArguments.
	self pipeline
		useCommand: self command
		on: (PyramidPipelineTarget new collection: aCollection).
	self makeNewInputsFor: self targetModel targets asArray
]

{ #category : #accessing }
PyramidProperty >> targetModel [
^ targetModel
]

{ #category : #'as yet unclassified' }
PyramidProperty >> updateTargetModelFrom: aCollection [

	self targetModel reset.

	aCollection
		select: [ :each | self command isExecutableBy: each ]
		thenDo: [ :each |
			self targetModel at: (self stateOf: each) arguments put: each ]
]
