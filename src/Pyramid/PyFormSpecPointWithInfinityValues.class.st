Class {
	#name : #PyFormSpecPointWithInfinityValues,
	#superclass : #PyFormSpecPoint,
	#instVars : [
		'infiniteX',
		'infiniteY'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyFormSpecPointWithInfinityValues >> activateCallbacks [

	inputX whenNumberChangedDo: [ :x | 
		xChangeCallBack value: x.
		self isInfiniteY
			ifTrue: [ pointChangeCallBack value: x @ Float infinity ]
			ifFalse: [ pointChangeCallBack value: x @ inputY number ] ].

	inputY whenNumberChangedDo: [ :y | 
		yChangeCallBack value: y.
		self isInfiniteX
			ifTrue: [ pointChangeCallBack value: Float infinity @ y ]
			ifFalse: [ pointChangeCallBack value: inputX number @ y ] ]
]

{ #category : #accessing }
PyFormSpecPointWithInfinityValues >> infiniteX [

	infiniteX := true.
	inputX
		number: '';
		enabled: false
]

{ #category : #accessing }
PyFormSpecPointWithInfinityValues >> infiniteY [

	infiniteY := true.
	inputY
		number: '';
		enabled: false
]

{ #category : #testing }
PyFormSpecPointWithInfinityValues >> isInfiniteX [

	^ infiniteX ifNil: [ infiniteX := false ]
]

{ #category : #testing }
PyFormSpecPointWithInfinityValues >> isInfiniteY [

	^ infiniteY ifNil: [ infiniteY := false ]
]

{ #category : #accessing }
PyFormSpecPointWithInfinityValues >> value: aPoint [

	self removeCallbacks.
	aPoint x isInfinite
		ifTrue: [ self infiniteX ]
		ifFalse: [ inputX number: aPoint x; enabled: true ].
	aPoint y isInfinite
		ifTrue: [ self infiniteY ]
		ifFalse: [ inputY number: aPoint y; enabled: true ].
	self activateCallbacks
]
