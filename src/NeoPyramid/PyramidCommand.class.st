Class {
	#name : #PyramidCommand,
	#superclass : #Object,
	#instVars : [
		'name',
		'state',
		'setBlock',
		'getBlock',
		'expectedTargets',
		'verificator'
	],
	#category : #'NeoPyramid-plugin-commands'
}

{ #category : #adding }
PyramidCommand class >> addChildren [

	^ self
		  name: #addChildren
		  set: [ :state :target | target addChildren: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source children asArray ]
		verificator: self verificatorBlElementClass
]

{ #category : #adding }
PyramidCommand class >> addElementOnCollection [

	^ self
		  name: #addElementOnCollection
		  set: [ :state :target | target addAll: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source elements asArray ]
		verificator: self verificatorBlElementClass
]

{ #category : #adding }
PyramidCommand class >> identifier [

	^ self
		  name: #identifier
		  set: [ :state :target | target id: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source id asSymbol ]
		verificator: self verificatorBlElementClass
]

{ #category : #adding }
PyramidCommand class >> name: aString set: aSetter get: aGetter verificator: aVerificator [

	^ self new
		  name: aString;
		  setBlock: aSetter;
		  getBlock: aGetter;
		  verificator: aVerificator;
		  yourself
]

{ #category : #adding }
PyramidCommand class >> removeChildren [

	^ self
		  name: #removeChildren
		  set: [ :state :target | target removeChildren: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source children asArray ]
		  verificator: self verificatorBlElementClass
]

{ #category : #adding }
PyramidCommand class >> removeElementOnCollection [

	^ self
		  name: #removeElementOnCollection
		  set: [ :state :target | target removeAll: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source elements asArray ]
		verificator: self verificatorBlElementClass
]

{ #category : #'as yet unclassified' }
PyramidCommand class >> verificatorBlElementClass [

	^ PyramidKindOfVerifierStrategy new classToTest: BlElement
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

{ #category : #testing }
PyramidCommand >> isExecutableBy: anObject [

	^ self verificator verify: anObject
]

{ #category : #accessing }
PyramidCommand >> name [
	^ name
]

{ #category : #accessing }
PyramidCommand >> name: aString [

	name := aString
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

{ #category : #accessing }
PyramidCommand >> state: aState [

	state := aState
]

{ #category : #accessing }
PyramidCommand >> verificator [

	verificator ifNil: [ verificator := PyramidAlwaysFalseVerifierStrategy new ].
	^ verificator
]

{ #category : #accessing }
PyramidCommand >> verificator: aVerificator [

	verificator := aVerificator
]
