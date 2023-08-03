Class {
	#name : #PyramidAllInsetsMode,
	#superclass : #PyramidInsetsMode,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #accessing }
PyramidAllInsetsMode class >> icon [

	^ self iconNamed: #group
]

{ #category : #'as yet unclassified' }
PyramidAllInsetsMode >> pyramidValueOf: aPyramidInsetsInputPresenter [

	^ BlInsets all: aPyramidInsetsInputPresenter inputAll value.
]

{ #category : #'as yet unclassified' }
PyramidAllInsetsMode >> setLayoutOf: aPyramidInsetsInputPresenter [

	aPyramidInsetsInputPresenter buttonMode icon: self class icon.
	aPyramidInsetsInputPresenter layout: (SpBoxLayout newHorizontal
			 spacing: 4;
			 add: aPyramidInsetsInputPresenter buttonMode width: 24;
			 add: 'all:' expand: false;
			 add: aPyramidInsetsInputPresenter inputAll;
			 yourself)
]

{ #category : #'as yet unclassified' }
PyramidAllInsetsMode >> switchInsetsMode: aPyramidInsetsInputPresenter [

	aPyramidInsetsInputPresenter setTopRightBottomLeftMode
]
