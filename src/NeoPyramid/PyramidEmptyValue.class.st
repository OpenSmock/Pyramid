Class {
	#name : #PyramidEmptyValue,
	#superclass : #PyramidUnknowState,
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #converting }
PyramidEmptyValue >> asString [

	^ '@ Empty state'
]

{ #category : #'as yet unclassified' }
PyramidEmptyValue >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectEmptyValue
]
