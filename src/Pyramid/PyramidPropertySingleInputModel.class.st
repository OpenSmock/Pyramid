Class {
	#name : #PyramidPropertySingleInputModel,
	#superclass : #Object,
	#instVars : [
		'input',
		'applyToAllButton',
		'reference'
	],
	#category : #'Pyramid-properties'
}

{ #category : #comparing }
PyramidPropertySingleInputModel >> <= aPyramidPropertySingleInputModel [

	self reference parent = aPyramidPropertySingleInputModel reference parent
		ifTrue: [
			^ (self reference parent childIndexOf:
				  self reference) <= (self reference parent childIndexOf: aPyramidPropertySingleInputModel reference) ].
	self reference allParentsDo: [ :p | p == aPyramidPropertySingleInputModel reference ifTrue: [ ^ false ] ].
	aPyramidPropertySingleInputModel reference allParentsDo: [ :p | p == self reference ifTrue: [ ^ true ] ].
	^ self reference hash <= aPyramidPropertySingleInputModel reference hash
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> applyToAllButton [

	^ applyToAllButton
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> applyToAllButton: anObject [

	applyToAllButton := anObject
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> input [

	^ input
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> input: anObject [

	input := anObject
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> reference [

	^ reference
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> reference: anObject [

	reference := anObject
]
