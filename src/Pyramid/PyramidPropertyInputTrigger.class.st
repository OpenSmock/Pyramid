Class {
	#name : #PyramidPropertyInputTrigger,
	#superclass : #Object,
	#instVars : [
		'selector'
	],
	#category : #'Pyramid-plugin-properties'
}

{ #category : #'as yet unclassified' }
PyramidPropertyInputTrigger >> argBlock: aCallbackBlock input: input collection: collection model: model [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputTrigger >> makeTriggerBloc: aCallbackBlock [

	^ [ :input :collection :model |
	  input
		  perform: self selector
		  with:
		  (self argBlock: aCallbackBlock input: input collection: collection model: model) ]
]

{ #category : #accessing }
PyramidPropertyInputTrigger >> selector [

	^ selector
]

{ #category : #accessing }
PyramidPropertyInputTrigger >> selector: anObject [

	selector := anObject
]
