Extension { #name : #BlVisibilityVisible }

{ #category : #'*Pyramid-Bloc' }
BlVisibilityVisible >> asIcon [

	^ self iconNamed: #haloView
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityVisible >> asString [

	^ 'visible'
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityVisible >> nextVisibilityForTree [

	^ BlVisibility hidden
]

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
