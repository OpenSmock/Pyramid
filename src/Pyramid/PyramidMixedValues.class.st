Class {
	#name : #PyramidMixedValues,
	#superclass : #PyramidUnknowState,
	#category : 'Pyramid-specs-custom'
}

{ #category : #converting }
PyramidMixedValues >> asString [

	^ '@ Mixed state'
]

{ #category : #'as yet unclassified' }
PyramidMixedValues >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectMixedValues.
]

{ #category : #initialization }
PyramidMixedValues >> setVisibilityOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter setVisibilityMixedValues
]
