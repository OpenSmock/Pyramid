Extension { #name : #BlRectangleGeometry }

{ #category : #'*Pyramid-Bloc' }
BlRectangleGeometry >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]
