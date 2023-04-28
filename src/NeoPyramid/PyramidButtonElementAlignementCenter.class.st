Class {
	#name : #PyramidButtonElementAlignementCenter,
	#superclass : #PyramidButtonElementAlignement,
	#category : #'NeoPyramid-views-deprecated'
}

{ #category : #adding }
PyramidButtonElementAlignementCenter >> addButton: aSpButtonPresenter withConstraints: aBlock on: aPyramidButtonView [

	aPyramidButtonView addButtonCenter: aSpButtonPresenter withConstraints: aBlock
]

{ #category : #'as yet unclassified' }
PyramidButtonElementAlignementCenter >> getHorizontalPopoverDirection [

	^ SpPopoverPosition bottom
]
