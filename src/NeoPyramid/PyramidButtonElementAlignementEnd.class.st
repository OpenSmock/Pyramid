Class {
	#name : #PyramidButtonElementAlignementEnd,
	#superclass : #PyramidButtonElementAlignement,
	#category : #NeoPyramid
}

{ #category : #adding }
PyramidButtonElementAlignementEnd >> addButton: aSpButtonPresenter withConstraints: aBlock on: aPyramidButtonView [

	aPyramidButtonView addButtonEnd: aSpButtonPresenter withConstraints: aBlock
]
