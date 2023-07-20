Class {
	#name : #NeoPyramidColorInputSingleLinePresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'hexInput',
		'alphaInput',
		'previewPresenter',
		'whenValueChangedDo'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #accessing }
NeoPyramidColorInputSingleLinePresenter >> alphaInput [

	^ alphaInput
]

{ #category : #'as yet unclassified' }
NeoPyramidColorInputSingleLinePresenter >> cleanHexValue: aString [

	| cleanString |
	cleanString := aString select: [ :each |
		               (each between: $a and: $f) or: [
			               (each between: $A and: $F) or: [ each isDigit ] ] ].

	cleanString size = 0 ifTrue: [ ^ '000000' ].
	cleanString size = 1 ifTrue: [ ^ cleanString repeat: 6 ].
	cleanString size = 2 ifTrue: [ ^ cleanString repeat: 3 ].
	cleanString size = 3 ifTrue: [ ^ cleanString repeat: 2 ].
	cleanString size = 4 ifTrue: [ ^ cleanString , '00' ].
	cleanString size = 5 ifTrue: [ ^ cleanString , '0' ].
	cleanString size > 6 ifTrue: [ ^ cleanString first: 6 ].
	^ cleanString
]

{ #category : #layout }
NeoPyramidColorInputSingleLinePresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 2;
		  add: self hexInput;
		  add: self alphaInput width: 40;
		  add: self previewPresenter width: 40;
		  yourself
]

{ #category : #accessing }
NeoPyramidColorInputSingleLinePresenter >> hexInput [

	^ hexInput
]

{ #category : #'initialization - deprecated' }
NeoPyramidColorInputSingleLinePresenter >> initializePresenter [

	whenValueChangedDo := [ :c |  ].
	hexInput := PyramidTextInputPresenter new.
	alphaInput := PyramidNumberInputPresenter new.
	previewPresenter := SpMorphPresenter new
		                    morph: Morph new;
		                    yourself.
	self alphaInput whenValueChangedDo: [ :e |
		self whenValueChangedDo value: self value.
		self updatePreview ].
	self hexInput whenValueChangedDo: [ :e |
		self whenValueChangedDo value: self value.
		self hexInput value: (self cleanHexValue: self hexInput value).
		self updatePreview ]
]

{ #category : #accessing }
NeoPyramidColorInputSingleLinePresenter >> previewPresenter [

	^ previewPresenter
]

{ #category : #actions }
NeoPyramidColorInputSingleLinePresenter >> updatePreview [

	| color |
	color := self value.
	color isColor ifFalse: [ ^ self ].
	self previewPresenter morph color: self value
]

{ #category : #'as yet unclassified' }
NeoPyramidColorInputSingleLinePresenter >> value [

	| color alpha |
	color := Color fromHexString:
		         (self cleanHexValue: self hexInput value).
	alpha := self alphaInput value.
	alpha isNumber ifFalse: [
		self alphaInput value: 100.
		alpha := 100 ].
	color alpha: (self alphaInput value / 100 min: 0 max: 1).
	^ color
]

{ #category : #'as yet unclassified' }
NeoPyramidColorInputSingleLinePresenter >> value: aColor [

	aColor isColor ifFalse: [
		self alphaInput value: aColor.
		self hexInput value: aColor ].
	self alphaInput value: (aColor alpha * 100) rounded.
	self hexInput value: aColor asHexString.
	self updatePreview
]

{ #category : #'as yet unclassified' }
NeoPyramidColorInputSingleLinePresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #'as yet unclassified' }
NeoPyramidColorInputSingleLinePresenter >> whenValueChangedDo: aBlock [

	whenValueChangedDo := aBlock
]
