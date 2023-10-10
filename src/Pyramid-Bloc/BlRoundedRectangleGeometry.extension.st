Extension { #name : #BlRoundedRectangleGeometry }

{ #category : #'*Pyramid-Bloc' }
BlRoundedRectangleGeometry >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class and: [ self cornerRadii = anObject cornerRadii ]
]
