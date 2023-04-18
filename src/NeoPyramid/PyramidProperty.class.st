Class {
	#name : #PyramidProperty,
	#superclass : #Object,
	#instVars : [
		'command',
		'model',
		'pipeline',
		'presenter'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidProperty class >> identifier [

	^ self new
		  command: PyramidCommand identifier;
		  presenter: (PyramidPropertyInput new inputBuilder: PyramidInputBuilder string; yourself);
		  pipeline: PyramidPipeline new;
		  yourself
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

{ #category : #testing }
PyramidProperty >> isValidTarget: anObject [

	^ self command isExecutableBy: anObject
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
	
	self flag: #TODO. "connect back the block submission to the presenter"
	
	"
	anObject whenSubmitDo: [ :pipelineTarget :state |
		self command state: state.
		self pipeline useCommand: self command on: pipelineTarget ]"
]

{ #category : #'as yet unclassified' }
PyramidProperty >> stateOf: anObject [

	^ (self command getStateFrom: anObject) source: nil; yourself
]

{ #category : #'as yet unclassified' }
PyramidProperty >> targetsFromCollection: aCollection [

	| dictionary targets |
	targets := aCollection select: [ :each | self isValidTarget: each ].

	dictionary := Dictionary new.
	targets do: [ :each |
		dictionary
			at: (self stateOf: each)
			ifPresent: [ :col | col add: each ]
			ifAbsentPut: [
				OrderedCollection new
					add: each;
					yourself ] ].

	self model statesDictionary: dictionary
]
