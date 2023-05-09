Class {
	#name : #PyramidPropertyInputForModel,
	#superclass : #Object,
	#instVars : [
		'input',
		'applyToAllButton'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputForModel >> applyToAllButton [

	^ applyToAllButton
]

{ #category : #accessing }
PyramidPropertyInputForModel >> applyToAllButton: anObject [

	applyToAllButton := anObject
]

{ #category : #accessing }
PyramidPropertyInputForModel >> input [

	^ input
]

{ #category : #accessing }
PyramidPropertyInputForModel >> input: anObject [

	input := anObject
]
