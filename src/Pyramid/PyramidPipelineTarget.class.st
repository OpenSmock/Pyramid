Class {
	#name : #PyramidPipelineTarget,
	#superclass : #Object,
	#instVars : [
		'collection'
	],
	#category : #'Pyramid-commands'
}

{ #category : #execution }
PyramidPipelineTarget >> cancel: aCommand [

	"do nothing"
]

{ #category : #accessing }
PyramidPipelineTarget >> collection [
	^ collection 
]

{ #category : #accessing }
PyramidPipelineTarget >> collection: aCollection [
	collection := aCollection
]

{ #category : #execution }
PyramidPipelineTarget >> execute: aCommand [
	"execute the command"
	self collection do: [ :each |
		aCommand setState: aCommand state on: each ]
]

{ #category : #execution }
PyramidPipelineTarget >> terminate: aCommand [
	"clean the injector and the command state."

	aCommand state: nil.
	self collection: nil
]

{ #category : #'as yet unclassified' }
PyramidPipelineTarget >> verify: aCommand [

	"verify the collection, then the command."
	self collection ifNil: [ ^ false ].
	self collection isCollection ifFalse: [ ^ false ].
	self collection: (self collection select: [ :each |  aCommand isExecutableBy: each ]).
	^ self collection isNotEmpty
]
