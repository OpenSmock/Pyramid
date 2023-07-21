Extension { #name : #BlBackground }

{ #category : #'*NeoPyramid' }
BlBackground >> = aBlBackground [

	aBlBackground == self ifTrue: [ ^ true ].
	^ aBlBackground class = self class
]

{ #category : #'*NeoPyramid' }
BlBackground >> asForm [

	^ self shouldBeImplemented
]

{ #category : #'*NeoPyramid' }
BlBackground >> asString [

	^ self shouldBeImplemented
]

{ #category : #'*NeoPyramid' }
BlBackground >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	self shouldBeImplemented
]
