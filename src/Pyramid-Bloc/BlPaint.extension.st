Extension { #name : #BlPaint }

{ #category : #'*Pyramid-Bloc' }
BlPaint >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	^ anObject class = self class
]

{ #category : #'*Pyramid-Bloc' }
BlPaint >> asForm [

	^ self shouldBeImplemented
]

{ #category : #'*Pyramid-Bloc' }
BlPaint >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	self shouldBeImplemented
]
