Class {
	#name : #PyramidButtonElementAlignementStart,
	#superclass : #PyramidButtonElementAlignement,
	#category : #'NeoPyramid-views'
}

{ #category : #adding }
PyramidButtonElementAlignementStart >> addButton: aSpButtonPresenter withConstraints: aBlock on: aPyramidButtonView [

	aPyramidButtonView addButtonStart: aSpButtonPresenter withConstraints: aBlock
]