Extension { #name : #BlCornerRadii }

{ #category : #'*Pyramid-Bloc' }
BlCornerRadii >> setCornerRadiiOn: aPyramidInsetsInputPresenter [

	((self topLeft closeTo: self bottomRight) and: [(self topRight closeTo: self bottomLeft)]) ifTrue: [
		(self topLeft closeTo: self topRight) ifTrue: [ aPyramidInsetsInputPresenter inputArray value: { self topLeft }. ] ifFalse: [ aPyramidInsetsInputPresenter inputArray value: { self topLeft . self topRight}. ].
		^ self ].

		aPyramidInsetsInputPresenter inputArray value: {
				self topLeft . self topRight . self bottomRight . self bottomLeft }.
	
]
