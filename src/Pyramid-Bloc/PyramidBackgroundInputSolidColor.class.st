Class {
	#name : #PyramidBackgroundInputSolidColor,
	#superclass : #PyramidBackgroundAbstractPaintInput,
	#instVars : [
		'previewPresenter',
		'colorPickerButton',
		'textInput',
		'color',
		'whenSubmitDo'
	],
	#category : #'Pyramid-Bloc-custom-specs'
}

{ #category : #'menu actions' }
PyramidBackgroundInputSolidColor >> awaitSubmition [

	self previewPresenter showWarning
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputSolidColor >> changedText: aText [

	(self validateString: aText)
		ifTrue: [
			self previewPresenter color: (Color fromHexString: self textInput text).
			self awaitSubmition ]
		ifFalse: [ self hasUnacceptedEdits: true ]
]

{ #category : #resolution }
PyramidBackgroundInputSolidColor >> clearSelection [
	self textInput text: ''.
]

{ #category : #accessing }
PyramidBackgroundInputSolidColor >> color [

	color ifNil: [ color := Color black ].
	^ color
]

{ #category : #accessing }
PyramidBackgroundInputSolidColor >> color: aColor [

	color = aColor ifFalse: [ self submitColor: aColor ].
	color := aColor.
	self previewPresenter color: aColor.
	self textInput text: (self hexStringWithAlphaFrom: aColor).
	self hasUnacceptedEdits: false
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputSolidColor >> colorPickerAction [

	| dialog |
	dialog := ColorSelectorDialogWindow new
		          title: 'Choose color';
		          selectedColor: self color.
	dialog openModal.
	dialog cancelled ifFalse: [ self color: dialog selectedColor ]
]

{ #category : #accessing }
PyramidBackgroundInputSolidColor >> colorPickerButton [

	^ colorPickerButton
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputSolidColor >> defaultLayout [

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
PyramidBackgroundInputSolidColor >> hasUnacceptedEdits: aBoolean [

	aBoolean
		ifTrue: [ self previewPresenter showError ]
		ifFalse: [
		self previewPresenter showOk ]
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputSolidColor >> hexStringWithAlphaFrom: aColor [

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
PyramidBackgroundInputSolidColor >> initializePresenters [

	colorPickerButton := SpButtonPresenter new
		                     icon: (self iconNamed: #haloRecolor);
		                     extent: 10 asPoint;
		                     action: [ self colorPickerAction ];
		                     yourself.

	textInput := SpTextInputFieldPresenter new.
	textInput whenSubmitDo: [ :text | self submitText: text ].
	textInput whenTextChangedDo: [ :text | self changedText: text ].

	previewPresenter := PyramidBackgroundPreviewSolidColor new yourself.
	self color: self color
]

{ #category : #accessing }
PyramidBackgroundInputSolidColor >> paint [

	^ self color
]

{ #category : #accessing }
PyramidBackgroundInputSolidColor >> previewPresenter [

	^ previewPresenter 
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputSolidColor >> submitColor: aColor [

	self whenSubmitDo value: aColor
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputSolidColor >> submitText: aString [

	(self validateString: aString)
		ifTrue: [ self color: (Color fromHexString: self textInput text) ]
		ifFalse: [
			self clearSelection.
			self hasUnacceptedEdits: true ]
]

{ #category : #accessing }
PyramidBackgroundInputSolidColor >> textInput [

	^ textInput
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputSolidColor >> validateString: aString [

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
PyramidBackgroundInputSolidColor >> whenSubmitDo [

	whenSubmitDo ifNil: [ whenSubmitDo := [ :c | ] ].
	^ whenSubmitDo
]

{ #category : #accessing }
PyramidBackgroundInputSolidColor >> whenSubmitDo: aBloc [

	whenSubmitDo := aBloc
]
