Class {
	#name : #PyramidPropertyInputForStateModel,
	#superclass : #PyramidPropertyInputForModel,
	#instVars : [
		'referenceState',
		'referenceCollection'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputForStateModel >> referenceCollection [

	^ referenceCollection
]

{ #category : #accessing }
PyramidPropertyInputForStateModel >> referenceCollection: anObject [

	referenceCollection := anObject
]

{ #category : #accessing }
PyramidPropertyInputForStateModel >> referenceState [

	^ referenceState
]

{ #category : #accessing }
PyramidPropertyInputForStateModel >> referenceState: anObject [

	referenceState := anObject
]
