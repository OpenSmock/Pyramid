Class {
	#name : #PyramidButtonElementAlignementEnd,
	#superclass : #PyramidButtonElementAlignement,
	#category : #'NeoPyramid-views'
}

{ #category : #adding }
PyramidButtonElementAlignementEnd >> addButton: aSpButtonPresenter withConstraints: aBlock on: aPyramidButtonView [

	aPyramidButtonView addButtonEnd: aSpButtonPresenter withConstraints: aBlock
]

{ #category : #'as yet unclassified' }
PyramidButtonElementAlignementEnd >> getHorizontalPopoverDirection [

	^ SpPopoverPosition right
]
