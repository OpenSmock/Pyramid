Extension { #name : #BlInsets }

{ #category : #'*Pyramid-Bloc' }
BlInsets >> setInsetsOn: aPyramidInsetsInputPresenter [

	aPyramidInsetsInputPresenter inputAll value: self top.
	aPyramidInsetsInputPresenter inputTop value: self top.
	aPyramidInsetsInputPresenter inputRight value: self right.
	aPyramidInsetsInputPresenter inputBottom value: self bottom.
	aPyramidInsetsInputPresenter inputLeft value: self left.
	self isUniform ifTrue: [  aPyramidInsetsInputPresenter setAllMode ] ifFalse: [ aPyramidInsetsInputPresenter setTopRightBottomLeftMode ]
]
