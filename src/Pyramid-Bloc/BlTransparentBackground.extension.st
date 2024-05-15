Extension { #name : 'BlTransparentBackground' }

{ #category : '*Pyramid-Bloc' }
BlTransparentBackground >> asForm [

	^ self iconNamed: #smallSelect
]

{ #category : '*Pyramid-Bloc' }
BlTransparentBackground >> asString [

	^ 'Transparent'
]

{ #category : '*Pyramid-Bloc' }
BlTransparentBackground >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectTransparent.
]
