Class {
	#name : #PyramidBackgroundModalPresenter,
	#superclass : #SpPresenter,
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'buttonTransparent',
		'buttonImage',
		'buttonComposite',
		'buttonPaint',
		'currentPresenter',
		'paintPresenter',
		'submitBlock'
	],
	#category : #'Pyramid-Bloc-custom-specs-background'
}

{ #category : #visiting }
PyramidBackgroundModalPresenter >> acceptLabel [

	^ 'Change Background'
]

{ #category : #accessing }
PyramidBackgroundModalPresenter >> buttonComposite [

	^ buttonComposite
]

{ #category : #accessing }
PyramidBackgroundModalPresenter >> buttonImage [

	^ buttonImage
]

{ #category : #accessing }
PyramidBackgroundModalPresenter >> buttonPaint [

	^ buttonPaint
]

{ #category : #accessing }
PyramidBackgroundModalPresenter >> buttonTransparent [

	^ buttonTransparent
]

{ #category : #'as yet unclassified' }
PyramidBackgroundModalPresenter >> changeBackground [

	self submitBlock value: self currentPresenter background
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundModalPresenter >> changeToComposite [

	self updateLayoutWith: PyramidBackgroundInputTransparent new
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundModalPresenter >> changeToImage [

	self updateLayoutWith: PyramidBackgroundInputImage new
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundModalPresenter >> changeToPaint [

	self updateLayoutWith: self paintPresenter
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundModalPresenter >> changeToTransparent [

	self updateLayoutWith: PyramidBackgroundInputTransparent new
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundModalPresenter >> currentPresenter [
^ currentPresenter
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundModalPresenter >> currentPresenter: anObject [

	currentPresenter := anObject
]

{ #category : #layout }
PyramidBackgroundModalPresenter >> defaultLayout [

	^ SpBoxLayout newVertical spacing: 4; add: (SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self buttonTransparent;
		  add: self buttonImage;
		  add: self buttonComposite;
		  add: self buttonPaint;
		  yourself) expand: false;
		add: self currentPresenter ; yourself
]

{ #category : #initialization }
PyramidBackgroundModalPresenter >> initializeDialogWindow: aDialogWindowPresenter [

	super initializeDialogWindow: aDialogWindowPresenter.
	aDialogWindowPresenter
		title: 'Changes Background';
		initialExtent: 600 @ 500;
		okAction: [ self changeBackground ]
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundModalPresenter >> initializePresenters [

	currentPresenter := PyramidBackgroundInputTransparent new.
	buttonTransparent := SpRadioButtonPresenter new
		                     label: 'Transparent';
		                     yourself.
	buttonImage := SpRadioButtonPresenter new
		               label: 'Image';
		               yourself.
	buttonComposite := SpRadioButtonPresenter new
		                   label: 'Composite';
		                   yourself.
	buttonPaint := SpRadioButtonPresenter new
		               label: 'Paint';
		               yourself.
	buttonTransparent associatedRadioButtons: {
			buttonImage.
			buttonComposite.
			buttonPaint }.
	buttonTransparent whenActivatedDo: [ self changeToTransparent ].
	buttonImage whenActivatedDo: [ self changeToImage ].
	buttonComposite whenActivatedDo: [ self changeToComposite ].
	buttonPaint whenActivatedDo: [ self changeToPaint ]
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundModalPresenter >> paintPresenter [
paintPresenter ifNil: [ paintPresenter := PyramidBackgroundInputPaint new].
^ paintPresenter
]

{ #category : #'as yet unclassified' }
PyramidBackgroundModalPresenter >> selectBackground: aBackground [

	aBackground pyramidSelectMenuOnModal: self

	
]

{ #category : #'as yet unclassified' }
PyramidBackgroundModalPresenter >> submitBlock [

	submitBlock ifNil: [ submitBlock := [ :b | ] ].
	^ submitBlock
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundModalPresenter >> updateLayoutWith: aSpPresenter [

	self layout replace: self currentPresenter with: aSpPresenter.
	self currentPresenter: aSpPresenter
]

{ #category : #'as yet unclassified' }
PyramidBackgroundModalPresenter >> whenSubmitDo: aBlock [

	submitBlock := aBlock
]
