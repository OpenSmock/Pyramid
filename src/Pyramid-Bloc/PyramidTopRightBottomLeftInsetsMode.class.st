Class {
	#name : #PyramidTopRightBottomLeftInsetsMode,
	#superclass : #PyramidInsetsMode,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #accessing }
PyramidTopRightBottomLeftInsetsMode class >> icon [

	^ self iconNamed: #paint
]

{ #category : #'as yet unclassified' }
PyramidTopRightBottomLeftInsetsMode >> pyramidValueOf: aPyramidInsetsInputPresenter [

	^ BlInsets
		  top: aPyramidInsetsInputPresenter inputTop value
		  left: aPyramidInsetsInputPresenter inputLeft value
		  bottom: aPyramidInsetsInputPresenter inputBottom value
		  right: aPyramidInsetsInputPresenter inputRight value
]

{ #category : #'as yet unclassified' }
PyramidTopRightBottomLeftInsetsMode >> setLayoutOf: aPyramidInsetsInputPresenter [

	aPyramidInsetsInputPresenter buttonMode icon: self class icon.
	aPyramidInsetsInputPresenter layout: (SpBoxLayout newHorizontal
			 spacing: 4;
			 add: aPyramidInsetsInputPresenter buttonMode width: 24;
			 add: 't:' expand: false;
			 add: aPyramidInsetsInputPresenter inputTop;
			 add: '| r:' expand: false;
			 add: aPyramidInsetsInputPresenter inputRight;
			 add: '| b:' expand: false;
			 add: aPyramidInsetsInputPresenter inputBottom;
			 add: '| l:' expand: false;
			 add: aPyramidInsetsInputPresenter inputLeft;
			 yourself)
]

{ #category : #'as yet unclassified' }
PyramidTopRightBottomLeftInsetsMode >> switchInsetsMode: aPyramidInsetsInputPresenter [

	aPyramidInsetsInputPresenter setAllMode
]
