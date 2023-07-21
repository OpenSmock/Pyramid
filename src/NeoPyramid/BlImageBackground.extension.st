Extension { #name : #BlImageBackground }

{ #category : #'*NeoPyramid' }
BlImageBackground >> = aBlBackground [

	super = aBlBackground ifFalse: [ ^ false ].
	^ self image = aBlBackground image
]

{ #category : #'*NeoPyramid' }
BlImageBackground >> asForm [

	^ self image
]

{ #category : #'*NeoPyramid' }
BlImageBackground >> asString [

	^ 'Image - ', self image asString
]

{ #category : #'*NeoPyramid' }
BlImageBackground >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	self shouldBeImplemented
]
