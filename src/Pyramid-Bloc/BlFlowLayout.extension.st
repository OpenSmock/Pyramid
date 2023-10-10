Extension { #name : #BlFlowLayout }

{ #category : #'*Pyramid-Bloc' }
BlFlowLayout >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	self orientation = anObject orientation ifFalse: [ ^ false ].
	self horizontalAlignment = anObject horizontalAlignment ifFalse: [ ^ false ].
	self verticalAlignment = anObject verticalAlignment ifFalse: [ ^ false ].
	^ true
]

{ #category : #'*Pyramid-Bloc' }
BlFlowLayout >> setLayoutOn: aPyramidLayoutInputPresenter [

	aPyramidLayoutInputPresenter setFlow
]
