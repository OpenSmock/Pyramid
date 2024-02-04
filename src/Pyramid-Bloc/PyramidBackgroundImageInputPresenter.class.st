Class {
	#name : #PyramidBackgroundImageInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'buttonEdit',
		'whenValueChangedDo',
		'image'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> buttonEdit [

	^ buttonEdit
]

{ #category : #layout }
PyramidBackgroundImageInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical add: self buttonEdit; yourself.
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> image [

	^ image
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> image: anObject [

	image := anObject
]

{ #category : #'as yet unclassified' }
PyramidBackgroundImageInputPresenter >> openModalWindow [

	| dialog window imageSelectorPresenter |
	
	imageSelectorPresenter := PyramidBackgroundStopsModalPresenter new.
	window := imageSelectorPresenter asModalWindow.
	window title: 'Choose the image'.
	dialog := window open.
	dialog isOk ifTrue: [
		self whenValueChangedDo value: imageSelectorPresenter image ]
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
