Class {
	#name : #PyFormSpecText,
	#superclass : #PyFormSpec,
	#instVars : [
		'textChangedCallBack',
		'label',
		'input'
	],
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Properties'
}

{ #category : #accessing }
PyFormSpecText class >> label: aString [ 

	^ self new
		 label: aString;
		 yourself
]

{ #category : #'as yet unclassified' }
PyFormSpecText >> activateCallbacks [

	input whenTextChangedDo: [ :val | 
		textChangedCallBack value: val ].
]

{ #category : #layout }
PyFormSpecText >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 5;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: self label width: self widthLabel;
				   add: input)
		  height: 20;
		  yourself
]

{ #category : #initialization }
PyFormSpecText >> initializePresenters [

	textChangedCallBack := [ :o |  ].

	input := self newTextInput.
]

{ #category : #accessing }
PyFormSpecText >> label [

	^ label ifNil: [ label := 'label' ]
]

{ #category : #accessing }
PyFormSpecText >> label: string [

label := string 
]

{ #category : #removing }
PyFormSpecText >> removeCallbacks [

	input whenTextChangedDo: [ :x |  ]
]

{ #category : #accessing }
PyFormSpecText >> value: string [

	self removeCallbacks.
	input text: string.
	self activateCallbacks
]

{ #category : #enumerating }
PyFormSpecText >> whenTextChangedDo: aBloc [

	textChangedCallBack := aBloc
]
