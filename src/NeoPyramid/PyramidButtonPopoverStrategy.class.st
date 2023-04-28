Class {
	#name : #PyramidButtonPopoverStrategy,
	#superclass : #Object,
	#category : #'NeoPyramid-views-deprecated'
}

{ #category : #'as yet unclassified' }
PyramidButtonPopoverStrategy >> positionFor: aPyramidButton [

	^ aPyramidButton align getHorizontalPopoverDirection
]
