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
PyramidBackgroundImageInputPresenter >> emptyValue [

	self image: PyramidEmptyValue  new.
	self buttonEdit label: 'Empty value'
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> image [

	^ image
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> image: anObject [

	image := anObject
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> initializePresenters [

	image := PyramidEmptyValue new.
	buttonEdit := SpButtonPresenter new
		              label: 'Edit image';
		              action: [ self openModalWindow ];
		              yourself
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> mixedValues [

	self image: PyramidMixedValues new.
	self buttonEdit label: 'Mixed values'
]

{ #category : #'as yet unclassified' }
PyramidBackgroundImageInputPresenter >> openModalWindow [

	| dialog window imageSelectorPresenter |
	imageSelectorPresenter := PyramidBackgroundImageModalPresenter new.
	imageSelectorPresenter image: self image.
	window := imageSelectorPresenter asDialogWindow.
	window title: 'Choose the image'.

	dialog := window open.
	dialog resize: 800 @ 600.
	dialog okAction: [
		self whenValueChangedDo value: imageSelectorPresenter currentObject ]
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> value [

	^ self image
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> value: anObject [

	self image: anObject
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidBackgroundImageInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
