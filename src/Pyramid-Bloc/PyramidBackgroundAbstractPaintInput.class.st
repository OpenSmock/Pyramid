Class {
	#name : #PyramidBackgroundAbstractPaintInput,
	#superclass : #SpPresenter,
	#instVars : [
		'whenSubmitDo'
	],
	#category : #'Pyramid-Bloc-custom-specs-background'
}

{ #category : #accessing }
PyramidBackgroundAbstractPaintInput >> paint [

	^ self shouldBeImplemented
]

{ #category : #accessing }
PyramidBackgroundAbstractPaintInput >> whenSubmitDo [

	^ whenSubmitDo
]

{ #category : #accessing }
PyramidBackgroundAbstractPaintInput >> whenSubmitDo: aBlock [

	whenSubmitDo:= aBlock

]
