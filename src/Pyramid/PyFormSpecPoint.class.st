Class {
	#name : #PyFormSpecPoint,
	#superclass : #PyFormSpec,
	#instVars : [
		'pointChangeCallBack',
		'xChangeCallBack',
		'yChangeCallBack',
		'inputX',
		'inputY',
		'labelX',
		'labelY'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'instance creation' }
PyFormSpecPoint class >> x: aStringX y: aStringY [
	
	^ self new labelX: aStringX; labelY: aStringY; yourself
]

{ #category : #'as yet unclassified' }
PyFormSpecPoint >> activateCallbacks [

	inputX whenNumberChangedDo: [ :x | 
		xChangeCallBack value: x.
		pointChangeCallBack value: x @ inputY number ].

	inputY whenNumberChangedDo: [ :y | 
		yChangeCallBack value: y.
		pointChangeCallBack value: inputX number @ y ]
]

{ #category : #layout }
PyFormSpecPoint >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 5;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: self labelX width: self widthLabel;
				   add: inputX)
		  height: 20;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: self labelY width: self widthLabel;
				   add: inputY)
		  height: 20;
		  yourself
]

{ #category : #initialization }
PyFormSpecPoint >> initializePresenters [

	pointChangeCallBack := [ :o |  ].
	xChangeCallBack := [ :o |  ].
	yChangeCallBack := [ :o |  ].

	inputX := self newNumberInput.
	inputY := self newNumberInput.

	inputX numberType: Integer.
	inputY numberType: Integer
]

{ #category : #accessing }
PyFormSpecPoint >> labelX [

	^ labelX ifNil: [ labelX := 'x' ]
]

{ #category : #accessing }
PyFormSpecPoint >> labelX: string [

	labelX := string
]

{ #category : #accessing }
PyFormSpecPoint >> labelY [

	^ labelY ifNil: [ labelY := 'y' ]
]

{ #category : #accessing }
PyFormSpecPoint >> labelY: string [

	labelY := string
]

{ #category : #'as yet unclassified' }
PyFormSpecPoint >> removeCallbacks [

	inputX whenNumberChangedDo: [ :x |  ].
	inputY whenNumberChangedDo: [ :y |  ]
]

{ #category : #accessing }
PyFormSpecPoint >> value: aPoint [

	self removeCallbacks.
	inputX number: aPoint x.
	inputY number: aPoint y.
	self activateCallbacks
]

{ #category : #enumerating }
PyFormSpecPoint >> whenPointChangeDo: aBloc [

	pointChangeCallBack := aBloc
]

{ #category : #enumerating }
PyFormSpecPoint >> whenXChangeDo: aBloc [

	xChangeCallBack := aBloc
]

{ #category : #enumerating }
PyFormSpecPoint >> whenYChangeDo: aBloc [

	yChangeCallBack := aBloc
]
