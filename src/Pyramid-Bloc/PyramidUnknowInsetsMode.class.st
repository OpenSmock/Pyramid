Class {
	#name : #PyramidUnknowInsetsMode,
	#superclass : #PyramidInsetsMode,
	#instVars : [
		'state'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #accessing }
PyramidUnknowInsetsMode class >> icon [

	^ self iconNamed: #help
]

{ #category : #'as yet unclassified' }
PyramidUnknowInsetsMode >> pyramidValueOf: aPyramidInsetsInputPresenter [

	^ self state
]

{ #category : #'as yet unclassified' }
PyramidUnknowInsetsMode >> setLayoutOf: aPyramidInsetsInputPresenter [

	aPyramidInsetsInputPresenter buttonMode icon: self class icon.
	aPyramidInsetsInputPresenter layout: (SpBoxLayout newHorizontal
			 spacing: 4;
			 add: aPyramidInsetsInputPresenter buttonMode width: 24;
			 add: '@ --';
			 yourself)
]

{ #category : #accessing }
PyramidUnknowInsetsMode >> state [

	^ state
]

{ #category : #accessing }
PyramidUnknowInsetsMode >> state: anObject [

	state := anObject
]

{ #category : #'as yet unclassified' }
PyramidUnknowInsetsMode >> switchInsetsMode: aPyramidInsetsInputPresenter [
]
