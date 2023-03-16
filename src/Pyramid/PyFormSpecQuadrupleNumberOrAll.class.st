Class {
	#name : #PyFormSpecQuadrupleNumberOrAll,
	#superclass : #PyFormSpecQuadrupleNumber,
	#instVars : [
		'allChangedCallBack',
		'inputAll',
		'radioAll',
		'radioCustom'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyFormSpecQuadrupleNumberOrAll >> activateCallbacks [

	super activateCallbacks.
	inputAll whenNumberChangedDo: [ :val | allChangedCallBack value: val ]
]

{ #category : #'as yet unclassified' }
PyFormSpecQuadrupleNumberOrAll >> changeInputMode [

	radioAll state
		ifTrue: [ self changeInputModeAll. self layout: self defaultLayoutAll ]
		ifFalse: [ self changeInputModeCustom. self layout: self defaultLayoutCustom ].
]

{ #category : #'as yet unclassified' }
PyFormSpecQuadrupleNumberOrAll >> changeInputModeAll [

	input1 enabled: false.
	input2 enabled: false.
	input3 enabled: false.
	input4 enabled: false.
	inputAll enabled: true.
]

{ #category : #'as yet unclassified' }
PyFormSpecQuadrupleNumberOrAll >> changeInputModeCustom [

	input1 enabled: true.
	input2 enabled: true.
	input3 enabled: true.
	input4 enabled: true.
	inputAll enabled: false
]

{ #category : #initialization }
PyFormSpecQuadrupleNumberOrAll >> connectPresenters [

	radioAll whenActivatedDo: [ self changeInputMode ].
	radioAll whenDeactivatedDo: [ self changeInputMode ].
	radioCustom whenChangedDo: [ self changeInputMode ].
]

{ #category : #layout }
PyFormSpecQuadrupleNumberOrAll >> defaultLayout [

	^ self defaultLayoutAll 
]

{ #category : #layout }
PyFormSpecQuadrupleNumberOrAll >> defaultLayoutAll [

	^ self defaultLayoutRadio
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: 'all' width: self widthLabel;
				   add: inputAll;
				   yourself)
		  height: 20;
		  yourself
]

{ #category : #layout }
PyFormSpecQuadrupleNumberOrAll >> defaultLayoutCustom [

	^ self defaultLayoutRadio
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: self label1 width: self widthLabel;
				   add: input1;
				   yourself)
		  height: 20;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: self label2 width: self widthLabel;
				   add: input2;
				   yourself)
		  height: 20;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: self label3 width: self widthLabel;
				   add: input3;
				   yourself)
		  height: 20;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: self label4 width: self widthLabel;
				   add: input4;
				   yourself)
		  height: 20;
		  yourself
]

{ #category : #layout }
PyFormSpecQuadrupleNumberOrAll >> defaultLayoutRadio [

	^ SpBoxLayout newTopToBottom
		  spacing: 5;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: radioAll;
				   add: radioCustom;
				   yourself)
		  height: 20;
		  yourself
]

{ #category : #initialization }
PyFormSpecQuadrupleNumberOrAll >> initializePresenters [

	super initializePresenters.
	
	inputAll := self newNumberInput.
	
	radioAll := self newRadioButton.
	radioCustom := self newRadioButton.
	
	radioAll associatedRadioButtons: { 
			radioCustom }.
	
	radioAll label: 'all'.
	radioCustom label: 'custom'
]

{ #category : #removing }
PyFormSpecQuadrupleNumberOrAll >> removeCallbacks [
	super removeCallbacks.
	inputAll whenTextChangedDo: [ :x |  ]
]

{ #category : #accessing }
PyFormSpecQuadrupleNumberOrAll >> value: aCollection [

	super value: aCollection.
	(aCollection allSatisfy: [ :val | val = (aCollection at: 1) ])
		ifTrue: [ 
			self removeCallbacks.
			inputAll number: (aCollection at: 1).
			self activateCallbacks.
			radioAll click ]
		ifFalse: [
			radioCustom click ]
]

{ #category : #enumerating }
PyFormSpecQuadrupleNumberOrAll >> whenAllChangedDo: aBloc [

	allChangedCallBack := aBloc
]
