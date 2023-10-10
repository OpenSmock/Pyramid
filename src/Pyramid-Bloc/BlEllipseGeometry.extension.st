Extension { #name : #BlEllipseGeometry }

{ #category : #'*Pyramid-Bloc' }
BlEllipseGeometry >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]
