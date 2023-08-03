Extension { #name : #BlEllipseGeometry }

{ #category : #'*Pyramid-Bloc' }
BlEllipseGeometry >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #'*Pyramid-Bloc' }
BlEllipseGeometry >> setGeometryOn: aPyramidGeometryInputPresenter [

	aPyramidGeometryInputPresenter setEllipseGeometry
]
