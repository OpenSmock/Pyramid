Class {
	#name : #PyFormPoint,
	#superclass : #PyFormAbstract,
	#instVars : [
		'xInput',
		'yInput'
	],
	#category : #'Pyramid-Editor-Properties-Form'
}

{ #category : #accessing }
PyFormPoint >> currentValue [

| x y |
	(NumberParser isNumber: self xInput text) ifFalse: [ ^ self ].
	(NumberParser isNumber: self yInput text) ifFalse: [ ^ self ].
	x := NumberParser parse: self xInput text.
	y := NumberParser parse: self yInput text.
	^ x @ y
]

{ #category : #accessing }
PyFormPoint >> currentValue: aPoint [

	self xInput text: aPoint x printString.
	self yInput text: aPoint y printString
]

{ #category : #layout }
PyFormPoint >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self xInput expand: true;
		  add: self yInput expand: true;
		  yourself
]

{ #category : #'as yet unclassified' }
PyFormPoint >> differentsValue [

	self xInput text: self defaultMixedText.
	self yInput text: self defaultMixedText
]

{ #category : #'as yet unclassified' }
PyFormPoint >> emptyValue [
	self xInput text: '--'.
	self yInput text: '--'
]

{ #category : #accessing }
PyFormPoint >> enabled: aBoolean [

	self xInput editable: aBoolean.
	self yInput editable: aBoolean.
]

{ #category : #initialization }
PyFormPoint >> initializePresenters [

	xInput := self newTextInput.
	yInput := self newTextInput.
	xInput whenSubmitDo: [ :text | self submitPoint ].
	yInput whenSubmitDo: [ :text | self submitPoint ]
]

{ #category : #'as yet unclassified' }
PyFormPoint >> submitPoint [

	|point|
	point := self currentValue.
	point = self ifFalse: [ self action value: point ]
]

{ #category : #'as yet unclassified' }
PyFormPoint >> xInput [
	^ xInput
]

{ #category : #accessing }
PyFormPoint >> yInput [

	^ yInput
]
