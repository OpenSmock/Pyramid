Extension { #name : #BlPaintBackground }

{ #category : #'*Pyramid-Bloc' }
BlPaintBackground >> = aBlBackground [

	super = aBlBackground ifFalse: [ ^ false ].
	^ self paint = aBlBackground paint
]

{ #category : #'*Pyramid-Bloc' }
BlPaintBackground >> asForm [

	^ self paint asForm
]

{ #category : #'*Pyramid-Bloc' }
BlPaintBackground >> asString [

	^ self paint asString
]

{ #category : #'*Pyramid-Bloc' }
BlPaintBackground >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	self paint selectOnBackgroundInput: aPyramidBackgroundInputPresenter
]
