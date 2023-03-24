Class {
	#name : #PyFormText,
	#superclass : #PyFormAbstract,
	#instVars : [
		'textInput'
	],
	#category : #'Pyramid-Editor-Panels-Properties'
}

{ #category : #accessing }
PyFormText >> currentValue [

	^ self textInput text
]

{ #category : #accessing }
PyFormText >> currentValue: aBlElementId [

	aBlElementId isString ifTrue: [ self textInput text: aBlElementId. ^ self ].
	aBlElementId isNoId ifTrue: [ self textInput text: ''. ^ self ].
	self textInput text: aBlElementId asSymbol

	
]

{ #category : #layout }
PyFormText >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self textInput expand: true;
		  yourself
]

{ #category : #'as yet unclassified' }
PyFormText >> differentsValue [

	self textInput text: self defaultMixedText
]

{ #category : #'as yet unclassified' }
PyFormText >> emptyValue [

	self textInput text: self defaultEmptyText
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
