Class {
	#name : #PyramidPropertyInputForModel,
	#superclass : #Object,
	#instVars : [
		'input',
		'applyForAllButton'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputForModel >> applyForAllButton [

	^ applyForAllButton
]

{ #category : #accessing }
PyramidPropertyInputForModel >> applyForAllButton: anObject [

	applyForAllButton := anObject
]

{ #category : #accessing }
PyramidPropertyInputForModel >> input [

	^ input
]

{ #category : #accessing }
PyramidPropertyInputForModel >> input: anObject [

	input := anObject
]
