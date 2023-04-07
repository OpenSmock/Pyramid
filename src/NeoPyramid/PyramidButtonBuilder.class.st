Class {
	#name : #PyramidButtonBuilder,
	#superclass : #Object,
	#instVars : [
		'buttonContraints'
	],
	#category : #NeoPyramid
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
PyramidButtonBuilder >> makeButtonFrom: aPyramidButton [

	^ SpButtonPresenter new
		  icon: aPyramidButton icon;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidButtonBuilder >> makeButtonFrom: aPyramidButton for: aPyramidButtonView [

	| button |
	button := self makeButtonFrom: aPyramidButton.
	aPyramidButton align addButton: button withConstraints: self buttonContraints on: aPyramidButtonView.
]
