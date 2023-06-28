Extension { #name : #BlElementGeometry }

{ #category : #'*Pyramid-Bloc' }
BlElementGeometry >> pyramidSelectOnPresenter: aPresenter [

	| selection |
	aPresenter model: PyramidGeometryModel default.
	selection := aPresenter model select: [ :each |
		             each isSelectableWith: self ].
	selection ifNotEmpty: [ selection first selectModelWith: self ]
]
