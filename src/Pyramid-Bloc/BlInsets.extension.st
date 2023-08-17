Extension { #name : #BlInsets }

{ #category : #'*Pyramid-Bloc' }
BlInsets >> setInsetsOn: aPyramidInsetsInputPresenter [

	self isUniform ifTrue: [
		aPyramidInsetsInputPresenter inputArray value: { self top }.
		^ self ].
	((self top closeTo: self bottom) and: [
		 self left closeTo: self right ]) ifTrue: [
		aPyramidInsetsInputPresenter inputArray value: {
				self top.
				self right }.
		^ self ].
	aPyramidInsetsInputPresenter inputArray value: {
			self top.
			self right.
			self bottom.
			self left }
]
