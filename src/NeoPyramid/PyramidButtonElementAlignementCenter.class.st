Class {
	#name : #PyramidButtonElementAlignementCenter,
	#superclass : #PyramidButtonElementAlignement,
	#category : #'NeoPyramid-views'
}

{ #category : #adding }
PyramidButtonElementAlignementCenter >> addButton: aSpButtonPresenter withConstraints: aBlock on: aPyramidButtonView [

	aPyramidButtonView addButtonCenter: aSpButtonPresenter withConstraints: aBlock
]