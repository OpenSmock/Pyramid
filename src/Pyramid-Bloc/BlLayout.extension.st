Extension { #name : #BlLayout }

{ #category : #'*Pyramid-Bloc' }
BlLayout >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #'*Pyramid-Bloc' }
BlLayout >> setLayoutOn: aPyramidLayoutInputPresenter [

	aPyramidLayoutInputPresenter setUnknowValue
]