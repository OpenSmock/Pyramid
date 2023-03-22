Class {
	#name : #PyFormText,
	#superclass : #PyFormAbstract,
	#instVars : [
		'textInput'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #accessing }
PyFormText >> currentValue [

	^ self textInput text
]

{ #category : #accessing }
PyFormText >> currentValue: aString [

	self textInput text: aString
]

{ #category : #layout }
PyFormText >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self textInput expand: true;
		  yourself
]

{ #category : #accessing }
PyFormText >> enabled: aBoolean [

	self textInput editable: aBoolean
]

{ #category : #initialization }
PyFormText >> initializePresenters [ 
	textInput := self newTextInput.
	textInput whenSubmitDo: [ :text | self submitText: text ].
]

{ #category : #'as yet unclassified' }
PyFormText >> submitText: aString [

	self action value: aString
]

{ #category : #accessing }
PyFormText >> textInput [
	
	^ textInput
]
