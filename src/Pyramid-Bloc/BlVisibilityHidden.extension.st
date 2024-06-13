Extension { #name : 'BlVisibilityHidden' }

{ #category : '*Pyramid-Bloc' }
BlVisibilityHidden >> asIcon [

	^ self iconNamed: #haloDrag
]

{ #category : '*Pyramid-Bloc' }
BlVisibilityHidden >> asString [

	^ 'hidden'
]

{ #category : '*Pyramid-Bloc' }
BlVisibilityHidden >> nextVisibilityForTree [

	^ BlVisibility gone
]

{ #category : '*Pyramid-Bloc' }
BlVisibilityHidden >> setVisibilityOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter setVisibilityHidden
]

{ #category : '*Pyramid-Bloc' }
BlVisibilityHidden >> switchNotVisibleOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter value: BlVisibility gone
]

{ #category : '*Pyramid-Bloc' }
BlVisibilityHidden >> switchVisibleOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter value: BlVisibility visible
]
