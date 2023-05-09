Class {
	#name : #PyramidBackgroundPropertyInput,
	#superclass : #SpPresenter,
	#instVars : [
		'submitBlock',
		'model',
		'modeSelector',
		'colorPreview',
		'inputPresenter'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #'as yet unclassified' }
PyramidBackgroundPropertyInput >> changeMode: aMode [

	self inputPresenter: aMode
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> colorPreview [

	^ colorPreview
]

{ #category : #layout }
PyramidBackgroundPropertyInput >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self modeSelector width: 120;
		  add: self inputPresenter expand: true;
		  yourself
]

{ #category : #initialization }
PyramidBackgroundPropertyInput >> initializePresenters [

	modeSelector := PyramidBackgroundModeSelector new.
	modeSelector backgroundInput: self.

	colorPreview := PyramidBackgroundColorPreview new.
	inputPresenter := SpNullPresenter new
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> inputPresenter [

	^ inputPresenter
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> inputPresenter: aPresenter [

	inputPresenter := aPresenter.
	self layout: self
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> modeSelector [

	^ modeSelector
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> model [

	^ model
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> model: aPyramidBackgroundPropertyInputModel [

	model := aPyramidBackgroundPropertyInputModel.
	self modeSelector model: aPyramidBackgroundPropertyInputModel.
	self colorPreview model: aPyramidBackgroundPropertyInputModel.
	self inputPresenter model: aPyramidBackgroundPropertyInputModel.
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> submitBlock [

	^ submitBlock
]

{ #category : #enumerating }
PyramidBackgroundPropertyInput >> whenSubmitDo: aBlock [

	submitBlock := aBlock
]
