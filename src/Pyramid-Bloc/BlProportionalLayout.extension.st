Extension { #name : #BlProportionalLayout }

{ #category : #'*Pyramid-Bloc' }
BlProportionalLayout >> asIcon [

	^ self iconNamed: #haloScale
]

{ #category : #'*Pyramid-Bloc' }
BlProportionalLayout >> setLayoutOn: aPyramidLayoutInputPresenter [

	aPyramidLayoutInputPresenter setProportionnal
]
