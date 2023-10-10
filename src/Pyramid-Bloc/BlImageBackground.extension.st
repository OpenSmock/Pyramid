Extension { #name : 'BlImageBackground' }

{ #category : '*Pyramid-Bloc' }
BlImageBackground >> = aBlBackground [

	super = aBlBackground ifFalse: [ ^ false ].
	^ self image = aBlBackground image
]

{ #category : '*Pyramid-Bloc' }
BlImageBackground >> asForm [

	^ self image
]

{ #category : '*Pyramid-Bloc' }
BlImageBackground >> asString [

	^ 'Image - ', self image asString
]

{ #category : '*Pyramid-Bloc' }
BlImageBackground >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectImage
]
