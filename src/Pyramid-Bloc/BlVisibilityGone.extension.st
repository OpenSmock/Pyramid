Extension { #name : 'BlVisibilityGone' }

{ #category : '*Pyramid-Bloc' }
BlVisibilityGone >> asIcon [

	^ self iconNamed: #haloDismiss
]

{ #category : '*Pyramid-Bloc' }
BlVisibilityGone >> asString [

	^ 'gone'
]

{ #category : '*Pyramid-Bloc' }
BlVisibilityGone >> nextVisibilityForTree [

	^ BlVisibility visible
]

{ #category : '*Pyramid-Bloc' }
BlVisibilityGone >> setVisibilityOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter setVisibilityGone
]

{ #category : '*Pyramid-Bloc' }
BlVisibilityGone >> switchNotVisibleOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter value: BlVisibility hidden.
]

{ #category : '*Pyramid-Bloc' }
BlVisibilityGone >> switchVisibleOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter value: BlVisibility visible
]
