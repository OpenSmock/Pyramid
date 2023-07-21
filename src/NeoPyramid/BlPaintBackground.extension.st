Extension { #name : #BlPaintBackground }

{ #category : #'*NeoPyramid' }
BlPaintBackground >> = aBlBackground [

	super = aBlBackground ifFalse: [ ^ false ].
	^ self paint = aBlBackground paint
]

{ #category : #'*NeoPyramid' }
BlPaintBackground >> asForm [

	^ self paint asForm
]

{ #category : #'*NeoPyramid' }
BlPaintBackground >> asString [

	^ self paint asString
]

{ #category : #'*NeoPyramid' }
BlPaintBackground >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	self paint selectOnBackgroundInput: aPyramidBackgroundInputPresenter
]
