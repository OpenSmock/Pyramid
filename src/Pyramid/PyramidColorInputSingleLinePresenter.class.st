Class {
	#name : 'PyramidColorInputSingleLinePresenter',
	#superclass : 'PyramidInputPresenter',
	#instVars : [
		'hexInput',
		'alphaInput',
		'previewPresenter',
		'whenValueChangedDo'
	],
	#category : 'Pyramid-specs-custom',
	#package : 'Pyramid',
	#tag : 'specs-custom'
}

{ #category : 'accessing' }
PyramidColorInputSingleLinePresenter >> alphaInput [

	^ alphaInput
]

{ #category : 'as yet unclassified' }
PyramidColorInputSingleLinePresenter >> applyStrings [

	self alphaInput strings: self strings.
	self hexInput strings: self strings
]

{ #category : 'as yet unclassified' }
PyramidColorInputSingleLinePresenter >> cleanHexValue: aString [

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

{ #category : 'layout' }
PyramidColorInputSingleLinePresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 2;
		  add: self hexInput;
		  add: self alphaInput width: 40;
		  add: self previewPresenter width: 40;
		  yourself
]

{ #category : 'accessing' }
PyramidColorInputSingleLinePresenter >> hexInput [

	^ hexInput
]

{ #category : 'initialization - deprecated' }
PyramidColorInputSingleLinePresenter >> initializePresenter [

	whenValueChangedDo := [ :c |  ].
	hexInput := PyramidTextInputPresenter new
		            value: 'FF0000';
		            strings: (PyramidInputStrings new help: 'Set the color value as an hex.');
		            yourself.
	alphaInput := PyramidNumberInputPresenter new
		              value: 100;
		              strings: (PyramidInputStrings new help:'Set the alpha value as a %.');
		              yourself.
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

{ #category : 'accessing' }
PyramidColorInputSingleLinePresenter >> previewPresenter [

	^ previewPresenter
]

{ #category : 'actions' }
PyramidColorInputSingleLinePresenter >> updatePreview [

	| color |
	color := self value.
	color isColor ifFalse: [ ^ self ].
	self previewPresenter morph color: self value
]

{ #category : 'as yet unclassified' }
PyramidColorInputSingleLinePresenter >> value [

	| color alpha |
	color := Color fromHexString:
		         (self cleanHexValue: self hexInput value).
	alpha := self alphaInput value.
	alpha isNumber ifFalse: [
		self alphaInput value: 100.
		alpha := 100 ].
	^ color alpha: (alpha / 100 min: 1 max: 0).
]

{ #category : 'as yet unclassified' }
PyramidColorInputSingleLinePresenter >> value: aColor [

	aColor isColor ifFalse: [
		self value: PyramidUnknowState new asColor.
		^ self ].
	self alphaInput value: (aColor alpha * 100) rounded.
	self hexInput value: aColor asHexString.
	self updatePreview
]

{ #category : 'as yet unclassified' }
PyramidColorInputSingleLinePresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : 'as yet unclassified' }
PyramidColorInputSingleLinePresenter >> whenValueChangedDo: aBlock [

	whenValueChangedDo := aBlock
]
