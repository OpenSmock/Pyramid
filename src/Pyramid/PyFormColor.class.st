Class {
	#name : #PyFormColor,
	#superclass : #PyFormAbstract,
	#instVars : [
		'morph',
		'morphPresenter',
		'singleLineForm',
		'colorPickerButton',
		'textInput',
		'color'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'menu actions' }
PyFormColor >> awaitSubmition [

	self morph borderColor: Color orange
]

{ #category : #'as yet unclassified' }
PyFormColor >> changeMorphColor: aColor [

	self morph color: aColor
]

{ #category : #'as yet unclassified' }
PyFormColor >> changedText: aText [

	(self validateString: aText)
		ifTrue: [
			self changeMorphColor: (Color fromHexString: self textInput text).
			self awaitSubmition ]
		ifFalse: [ self hasUnacceptedEdits: true ]
]

{ #category : #resolution }
PyFormColor >> clearSelection [
	self textInput text: ''.
]

{ #category : #accessing }
PyFormColor >> color [
	
	^ color
]

{ #category : #accessing }
PyFormColor >> color: aColor [

	color := aColor
]

{ #category : #'as yet unclassified' }
PyFormColor >> colorPickerAction [

	| dialog |
	dialog := ColorSelectorDialogWindow new
		          title: 'Choose color';
		          selectedColor: self color.
	dialog openModal.
	dialog cancelled ifFalse: [ self submitColor: dialog selectedColor ]
]

{ #category : #accessing }
PyFormColor >> colorPickerButton [

	^ colorPickerButton
]

{ #category : #'as yet unclassified' }
PyFormColor >> convertBackgroundAsColor: aBlBackground [ 

	(aBlBackground isKindOf: Color) ifTrue: [ ^ aBlBackground ].
	aBlBackground isTransparent ifTrue: [ ^ Color transparent ].
	^ aBlBackground paint color
]

{ #category : #accessing }
PyFormColor >> currentValue [

	^ self color
]

{ #category : #accessing }
PyFormColor >> currentValue: aBackground [

	| aColor |
	aColor := self convertBackgroundAsColor: aBackground.

	self changeMorphColor: aColor.
	self textInput text: (self hexStringWithAlphaFrom: aColor).
	self color: aColor.
	self hasUnacceptedEdits: false.
]

{ #category : #'as yet unclassified' }
PyFormColor >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self morphPresenter withConstraints: [ :c |
		  c
			  width: 24;
			  height: 24 ];
		add: self colorPickerButton withConstraints: [ :c |
			  c
				  width: 24;
				  height: 24 ];
		  add: self textInput expand: true;
		  yourself
]

{ #category : #'as yet unclassified' }
PyFormColor >> differentsValue [

	self textInput text: self defaultMixedText
]

{ #category : #'as yet unclassified' }
PyFormColor >> emptyValue [

	self textInput text: self defaultEmptyText
]

{ #category : #accessing }
PyFormColor >> enabled: aBoolean [

	self textInput editable: aBoolean.
	self colorPickerButton enabled: aBoolean
]

{ #category : #testing }
PyFormColor >> hasUnacceptedEdits: aBoolean [

	aBoolean
		ifTrue: [ self morph borderColor: Color red ]
		ifFalse: [ self morph borderColor: Color black ]
]

{ #category : #'as yet unclassified' }
PyFormColor >> hexStringWithAlphaFrom: aColor [

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
PyFormColor >> initializePresenters [

	colorPickerButton := SpButtonPresenter new
		                     icon: (self iconNamed: #haloRecolor);
		                     extent: 10 asPoint;
		                     action: [ self colorPickerAction ];
		                     yourself.

	textInput := SpTextInputFieldPresenter new.
	textInput whenSubmitDo: [ :text | self submitText: text ].
	textInput whenTextChangedDo: [ :text | self changedText: text ].

	morph := Morph new.
	morph borderWidth: 2.

	morphPresenter := self newMorph.
	morphPresenter morph: morph.
	morphPresenter extent: 10 asPoint.
	
"default color"

	self submitColor: Color white.
]

{ #category : #accessing }
PyFormColor >> morph [
	
	^ morph
]

{ #category : #accessing }
PyFormColor >> morphPresenter [
	
	^ morphPresenter
]

{ #category : #'as yet unclassified' }
PyFormColor >> submitColor: aColor [

	self currentValue: aColor.
	self action value: aColor
]

{ #category : #'as yet unclassified' }
PyFormColor >> submitText: aString [

	(self validateString: aString)
		ifTrue: [ self submitColor: (Color fromHexString: self textInput text) ]
		ifFalse: [
			self clearSelection.
			self hasUnacceptedEdits: true ]
]

{ #category : #accessing }
PyFormColor >> textInput [

	^ textInput
]

{ #category : #'as yet unclassified' }
PyFormColor >> validateString: aString [

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
