Class {
	#name : #PyramidMixedValues,
	#superclass : #PyramidUnknowState,
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #converting }
PyramidMixedValues >> asString [

	^ '@ Mixed state'
]

{ #category : #'as yet unclassified' }
PyramidMixedValues >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectMixedValues.
]
