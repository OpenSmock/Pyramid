Extension { #name : #BlBasicLayout }

{ #category : #'*Pyramid-Bloc' }
BlBasicLayout >> asIcon [

	^ self iconNamed: #checkBoxOff
]

{ #category : #'*Pyramid-Bloc' }
BlBasicLayout >> setLayoutOn: aPyramidLayoutInputPresenter [

	aPyramidLayoutInputPresenter setBasic
]
