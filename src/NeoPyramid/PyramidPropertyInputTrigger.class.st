Class {
	#name : #PyramidPropertyInputTrigger,
	#superclass : #Object,
	#instVars : [
		'selector'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #'as yet unclassified' }
PyramidPropertyInputTrigger >> argBlock: aCallbackBlock input: input collection: collection [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputTrigger >> makeTriggerBloc: aCallbackBlock [

	^ [ :input :collection |
	  input perform: self selector with: (self argBlock: aCallbackBlock input: input collection: collection) ]
]

{ #category : #accessing }
PyramidPropertyInputTrigger >> selector [

	^ selector
]

{ #category : #accessing }
PyramidPropertyInputTrigger >> selector: anObject [

	selector := anObject
]
