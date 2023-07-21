Extension { #name : #BlPaint }

{ #category : #'*NeoPyramid' }
BlPaint >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	^ anObject class = self class
]

{ #category : #'*NeoPyramid' }
BlPaint >> asForm [

	^ self shouldBeImplemented
]

{ #category : #'*NeoPyramid' }
BlPaint >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	self shouldBeImplemented
]
