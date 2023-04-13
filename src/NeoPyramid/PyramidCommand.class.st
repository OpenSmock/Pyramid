Class {
	#name : #PyramidCommand,
	#superclass : #Object,
	#instVars : [
		'state',
		'setBlock',
		'getBlock'
	],
	#category : #'NeoPyramid-plugin-commands'
}

{ #category : #adding }
PyramidCommand class >> addChildren [

	^ self
		  set: [ :state :target | target addChildren: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source children asArray ]
]

{ #category : #adding }
PyramidCommand class >> addElementOnCollection [

	^ self
		  set: [ :state :target | target addAll: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source elements asArray ]
]

{ #category : #adding }
PyramidCommand class >> removeChildren [

	^ self
		  set: [ :state :target | target removeChildren: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source children asArray ]
]

{ #category : #adding }
PyramidCommand class >> removeElementOnCollection [

	^ self
		  set: [ :state :target | target removeAll: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source elements asArray ]
]

{ #category : #adding }
PyramidCommand class >> set: aSetter get: aGetter [

	^ self new setBlock: aSetter; getBlock: aGetter; yourself
]

{ #category : #accessing }
PyramidCommand >> getBlock [

	^ getBlock
]

{ #category : #accessing }
PyramidCommand >> getBlock: anObject [

	getBlock := anObject
]

{ #category : #initialization }
PyramidCommand >> getState: aPyramidCommandState from: aSource [

	self getBlock value: aPyramidCommandState value: aSource
]

{ #category : #accessing }
PyramidCommand >> setBlock [

	^ setBlock
]

{ #category : #accessing }
PyramidCommand >> setBlock: anObject [

	setBlock := anObject
]

{ #category : #initialization }
PyramidCommand >> setState: aPyramidCommandState on: aTarget [

	self setBlock value: aPyramidCommandState value: aTarget
]

{ #category : #accessing }
PyramidCommand >> state [

	state ifNil: [ state := PyramidCommandState new ].
	^ state
]
