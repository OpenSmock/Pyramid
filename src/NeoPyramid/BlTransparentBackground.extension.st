Extension { #name : #BlTransparentBackground }

{ #category : #'*NeoPyramid' }
BlTransparentBackground >> asForm [

	^ self iconNamed: #smallSelect
]

{ #category : #'*NeoPyramid' }
BlTransparentBackground >> asString [

	^ 'Transparent'
]

{ #category : #'*NeoPyramid' }
BlTransparentBackground >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectTransparent.
]
