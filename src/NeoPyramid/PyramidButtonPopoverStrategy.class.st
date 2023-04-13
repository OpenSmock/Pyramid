Class {
	#name : #PyramidButtonPopoverStrategy,
	#superclass : #Object,
	#category : #'NeoPyramid-views'
}

{ #category : #'as yet unclassified' }
PyramidButtonPopoverStrategy >> positionFor: aPyramidButton [

	^ aPyramidButton align getHorizontalPopoverDirection
]
