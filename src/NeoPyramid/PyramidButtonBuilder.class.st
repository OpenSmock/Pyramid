Class {
	#name : #PyramidButtonBuilder,
	#superclass : #Object,
	#instVars : [
		'buttonContraints',
		'popoverStrategy'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #accessing }
PyramidButtonBuilder >> buttonContraints [

	^ buttonContraints
]

{ #category : #accessing }
PyramidButtonBuilder >> buttonContraints: aBlock [

	buttonContraints := aBlock
]

{ #category : #'as yet unclassified' }
PyramidButtonBuilder >> makeButtonFrom: aPyramidButton for: aPyramidButtonView [

	| button |
	button := aPyramidButton asSpecButtonFor: self.
	aPyramidButton align
		addButton: button
		withConstraints: self buttonContraints
		on: aPyramidButtonView
]

{ #category : #accessing }
PyramidButtonBuilder >> popoverStrategy [

	^ popoverStrategy
]

{ #category : #accessing }
PyramidButtonBuilder >> popoverStrategy: aStrategy [

	popoverStrategy:=aStrategy
]
