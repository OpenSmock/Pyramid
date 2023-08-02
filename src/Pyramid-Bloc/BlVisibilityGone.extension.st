Extension { #name : #BlVisibilityGone }

{ #category : #'*Pyramid-Bloc' }
BlVisibilityGone >> setVisibilityOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter setVisibilityGone
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityGone >> switchNotVisibleOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter value: BlVisibility hidden.
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityGone >> switchVisibleOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter value: BlVisibility visible
]
