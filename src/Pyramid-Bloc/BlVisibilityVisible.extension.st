Extension { #name : #BlVisibilityVisible }

{ #category : #'*Pyramid-Bloc' }
BlVisibilityVisible >> setVisibilityOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter setVisibilityVisible
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityVisible >> switchNotVisibleOn: aPyramidVisibilityInputPresenter [
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityVisible >> switchVisibleOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter value: BlVisibility hidden
]
