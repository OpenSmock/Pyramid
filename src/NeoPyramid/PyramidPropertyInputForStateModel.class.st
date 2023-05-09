Class {
	#name : #PyramidPropertyInputForStateModel,
	#superclass : #PyramidPropertyInputForModel,
	#instVars : [
		'referenceState'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputForStateModel >> referenceState [

	^ referenceState
]

{ #category : #accessing }
PyramidPropertyInputForStateModel >> referenceState: anObject [

	referenceState := anObject
]
