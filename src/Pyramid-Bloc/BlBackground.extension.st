Extension { #name : #BlBackground }

{ #category : #'*Pyramid-Bloc' }
BlBackground >> = aBlBackground [

	aBlBackground == self ifTrue: [ ^ true ].
	^ aBlBackground class = self class
]

{ #category : #'*Pyramid-Bloc' }
BlBackground >> asForm [

	^ self shouldBeImplemented
]

{ #category : #'*Pyramid-Bloc' }
BlBackground >> asString [

	^ self shouldBeImplemented
]

{ #category : #'*Pyramid-Bloc' }
BlBackground >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	self shouldBeImplemented
]
