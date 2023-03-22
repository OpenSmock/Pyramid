Class {
	#name : #PyFormSpecQuadrupleNumber,
	#superclass : #PyFormSpec,
	#instVars : [
		'n1ChangedCallBack',
		'n2ChangedCallBack',
		'n3ChangedCallBack',
		'n4ChangedCallBack',
		'input1',
		'input2',
		'input3',
		'input4',
		'label1',
		'label2',
		'label3',
		'label4',
		'inputsChangedCallBack'
	],
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyFormSpecQuadrupleNumber class >> l1: s1 l2: s2 l3: s3 l4: s4 [

	^ self new label1: s1; label2: s2; label3: s3; label4: s4; yourself
]

{ #category : #'as yet unclassified' }
PyFormSpecQuadrupleNumber >> activateCallbacks [

	input1 whenNumberChangedDo: [ :n | 
		n1ChangedCallBack value: n.
		inputsChangedCallBack value: self collection ].
	input2 whenNumberChangedDo: [ :n | 
		n2ChangedCallBack value: n.
		inputsChangedCallBack value: self collection ].
	input3 whenNumberChangedDo: [ :n | 
		n3ChangedCallBack value: n.
		inputsChangedCallBack value: self collection ].
	input4 whenNumberChangedDo: [ :n | 
		n4ChangedCallBack value: n.
		inputsChangedCallBack value: self collection ]
]

{ #category : #adding }
PyFormSpecQuadrupleNumber >> addOn: aLayout [

	aLayout add: self withConstraints: [ :constraints | 
		  constraints expand: false; height: 70 ]
]

{ #category : #requirements }
PyFormSpecQuadrupleNumber >> collection [

	^ { input1 number . input2 number. input3 number. input4 number }
]

{ #category : #layout }
PyFormSpecQuadrupleNumber >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 5;
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

{ #category : #initialization }
PyFormSpecQuadrupleNumber >> initializePresenters [

	n1ChangedCallBack := [ :o |  ].
	n2ChangedCallBack := [ :o |  ].
	n3ChangedCallBack := [ :o |  ].
	n4ChangedCallBack := [ :o |  ].
	inputsChangedCallBack := [ :o |  ].

	input1 := self newNumberInput
		          numberType: Integer;
		          yourself.
	input2 := self newNumberInput
		          numberType: Integer;
		          yourself.
	input3 := self newNumberInput
		          numberType: Integer;
		          yourself.
	input4 := self newNumberInput
		          numberType: Integer;
		          yourself
]

{ #category : #accessing }
PyFormSpecQuadrupleNumber >> label1 [

	^ label1 ifNil: [ label1 := 'label1' ]
]

{ #category : #accessing }
PyFormSpecQuadrupleNumber >> label1: string [

	label1 := string
]

{ #category : #accessing }
PyFormSpecQuadrupleNumber >> label2 [

	^ label2 ifNil: [ label2 := 'label2' ]
]

{ #category : #accessing }
PyFormSpecQuadrupleNumber >> label2: string [

	label2 := string
]

{ #category : #accessing }
PyFormSpecQuadrupleNumber >> label3 [

	^ label3 ifNil: [ label3 := 'label3' ]
]

{ #category : #accessing }
PyFormSpecQuadrupleNumber >> label3: string [

	label3 := string
]

{ #category : #accessing }
PyFormSpecQuadrupleNumber >> label4 [

	^ label4 ifNil: [ label4 := 'label4' ]
]

{ #category : #accessing }
PyFormSpecQuadrupleNumber >> label4: string [

	label4 := string
]

{ #category : #removing }
PyFormSpecQuadrupleNumber >> removeCallbacks [

	input1 whenNumberChangedDo: [ :x |  ].
	input2 whenNumberChangedDo: [ :x |  ].
	input3 whenNumberChangedDo: [ :x |  ].
	input4 whenNumberChangedDo: [ :x |  ]
]

{ #category : #accessing }
PyFormSpecQuadrupleNumber >> value: collection [

	self removeCallbacks.
	input1 number: (collection at: 1).
	input2 number: (collection at: 2).
	input3 number: (collection at: 3).
	input4 number: (collection at: 4).
	self activateCallbacks
]

{ #category : #enumerating }
PyFormSpecQuadrupleNumber >> whenInput1ChangedDo: aBloc [

	n1ChangedCallBack := aBloc
]

{ #category : #enumerating }
PyFormSpecQuadrupleNumber >> whenInput2ChangedDo: aBloc [

	n2ChangedCallBack := aBloc
]

{ #category : #enumerating }
PyFormSpecQuadrupleNumber >> whenInput3ChangedDo: aBloc [

	n3ChangedCallBack := aBloc
]

{ #category : #enumerating }
PyFormSpecQuadrupleNumber >> whenInput4ChangedDo: aBloc [

	n4ChangedCallBack := aBloc
]

{ #category : #enumerating }
PyFormSpecQuadrupleNumber >> whenInputChangedDo: aBloc [

	inputsChangedCallBack := aBloc
]
