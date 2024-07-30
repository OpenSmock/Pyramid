Class {
	#name : #PyramidEmptyValue,
	#superclass : #PyramidUnknowState,
	#category : 'Pyramid-specs-custom'
}

{ #category : #converting }
PyramidEmptyValue >> asString [

	^ '@ Empty state'
]

{ #category : #'as yet unclassified' }
PyramidEmptyValue >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectEmptyValue
]

{ #category : #initialization }
PyramidEmptyValue >> setVisibilityOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter setVisibilityEmptyValue
]
