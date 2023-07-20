Extension { #name : #BlImageBackground }

{ #category : #'*NeoPyramid' }
BlImageBackground >> asForm [

	^ self image
]

{ #category : #'*NeoPyramid' }
BlImageBackground >> asString [

	^ 'Image - ', self image asString
]
