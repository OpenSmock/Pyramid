Class {
	#name : #PyramidColorInputPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'previewPresenter',
		'colorPickerButton',
		'textInput',
		'color',
		'whenSubmitDo'
	],
	#category : #'Pyramid-Bloc-custom-specs-color'
}

{ #category : #'menu actions' }
PyramidColorInputPresenter >> awaitSubmition [

	self previewPresenter showWarning
]

{ #category : #'as yet unclassified' }
PyramidColorInputPresenter >> changedText: aText [

	(self validateString: aText)
		ifTrue: [
			self previewPresenter color: (Color fromHexString: self textInput text).
			self awaitSubmition ]
		ifFalse: [ self hasUnacceptedEdits: true ]
]

{ #category : #resolution }
PyramidColorInputPresenter >> clearSelection [
	self textInput text: ''.
]

{ #category : #accessing }
PyramidColorInputPresenter >> color [

	color ifNil: [ color := Color black ].
	^ color
]

{ #category : #accessing }
PyramidColorInputPresenter >> color: aColor [

	color = aColor ifTrue: [ ^ self ].
	color := aColor.
	self submitColor: aColor.
	self previewPresenter color: aColor.
	self textInput text: (self hexStringWithAlphaFrom: aColor).
	self hasUnacceptedEdits: false
]

{ #category : #'as yet unclassified' }
PyramidColorInputPresenter >> colorPickerAction [

	| dialog |
	dialog := ColorSelectorDialogWindow new
		          title: 'Choose color';
		          selectedColor: self color.
	dialog openModal.
	dialog cancelled ifFalse: [ self color: dialog selectedColor ]
]

{ #category : #accessing }
PyramidColorInputPresenter >> colorPickerButton [

	^ colorPickerButton
]

{ #category : #accessing }
PyramidColorInputPresenter >> defaultColor: aColor [

	color := aColor.
	self previewPresenter color: aColor.
	self textInput text: (self hexStringWithAlphaFrom: aColor).
	self hasUnacceptedEdits: false
]

{ #category : #'as yet unclassified' }
PyramidColorInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self previewPresenter expand: true;
		  add: self textInput withConstraints: [ :c |
			  c
				  width: 80;
				  height: 24 ]; 
		  add: self colorPickerButton withConstraints: [ :c |
		  c
			  width: 24;
			  height: 24 ];
		  yourself
]

{ #category : #testing }
PyramidColorInputPresenter >> hasUnacceptedEdits: aBoolean [

	aBoolean
		ifTrue: [ self previewPresenter showError ]
		ifFalse: [
		self previewPresenter showOk ]
]

{ #category : #'as yet unclassified' }
PyramidColorInputPresenter >> hexStringWithAlphaFrom: aColor [

	| s alpha |

	alpha := (aColor alpha * 255) asInteger printStringHex.

	s := aColor asHexString , '00'.
	alpha size = 1 ifTrue: [ s at: 8 put: (alpha at: 1) ].
	alpha size = 2 ifTrue: [
		s at: 7 put: (alpha at: 1).
		s at: 8 put: (alpha at: 2) ].
	^ s
]

{ #category : #accessing }
PyramidColorInputPresenter >> initializePresenters [

	colorPickerButton := SpButtonPresenter new
		                     icon: (self iconNamed: #haloRecolor);
		                     extent: 10 asPoint;
		                     action: [ self colorPickerAction ];
		                     yourself.

	textInput := SpTextInputFieldPresenter new.
	textInput whenSubmitDo: [ :text | self submitText: text ].
	textInput whenTextChangedDo: [ :text | self changedText: text ].

	previewPresenter := PyramidPaintPreviewSolidColor new yourself.
	self defaultColor: self color
]

{ #category : #accessing }
PyramidColorInputPresenter >> paint [

	^ self color asBlPaint
]

{ #category : #accessing }
PyramidColorInputPresenter >> previewPresenter [

	^ previewPresenter 
]

{ #category : #'as yet unclassified' }
PyramidColorInputPresenter >> submitColor: aColor [

	self whenSubmitDo value: aColor
]

{ #category : #'as yet unclassified' }
PyramidColorInputPresenter >> submitText: aString [

	(self validateString: aString)
		ifTrue: [ self color: (Color fromHexString: self textInput text) ]
		ifFalse: [
			self clearSelection.
			self hasUnacceptedEdits: true ]
]

{ #category : #accessing }
PyramidColorInputPresenter >> textInput [

	^ textInput
]

{ #category : #'as yet unclassified' }
PyramidColorInputPresenter >> validateString: aString [

	| text |
	aString ifEmpty: [ ^ false ].
	text := aString first = $#
		        ifTrue: [ aString allButFirst ]
		        ifFalse: [ aString ].
	(text size < 6) ifTrue: [ ^ false ].
	(text size = 7) ifTrue: [ ^ false ].
	(text size > 8) ifTrue: [ ^ false ].

	^ text allSatisfy: [ :c |
		  c isDigit or: [
			  { $a. $b. $c. $d. $e. $f. $A. $B. $C. $D. $E. $F } anySatisfy: [
				  :any | any = c ] ] ]
]

{ #category : #accessing }
PyramidColorInputPresenter >> whenSubmitDo [

	^ whenSubmitDo
]

{ #category : #accessing }
PyramidColorInputPresenter >> whenSubmitDo: aBlock [

	whenSubmitDo := aBlock
]
