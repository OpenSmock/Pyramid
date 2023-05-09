Class {
	#name : #PyramidCommand,
	#superclass : #Object,
	#instVars : [
		'name',
		'state',
		'setBlock',
		'getBlock',
		'isExecutableBlock'
	],
	#category : #'NeoPyramid-commands'
}

{ #category : #adding }
PyramidCommand class >> addChildren [

	^ self
		  name: #addChildren
		  set: [ :state :target | target addChildren: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source children asArray ]
		  isExecutableBlock: [ :obj :state | obj isKindOf: BlElement ]
]

{ #category : #adding }
PyramidCommand class >> addElementOnCollection [

	^ self
		  name: #addElementOnCollection
		  set: [ :state :target | target addAll: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source elements asArray ]
		  isExecutableBlock: [ :obj :state| obj isCollection ]
]

{ #category : #adding }
PyramidCommand class >> background [

	^ self
		  name: #background
		  set: [ :state :target | target background: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source background ]
		  isExecutableBlock: [ :obj :state | (obj isKindOf: BlElement) ]
]

{ #category : #adding }
PyramidCommand class >> identifier [

	^ self
		  name: #identifier
		  set: [ :state :target | target id: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source id asSymbol ]
		  isExecutableBlock: [ :obj :state | (obj isKindOf: BlElement) and: [
				  state arguments ~= obj id asSymbol ]]
]

{ #category : #adding }
PyramidCommand class >> name: aString set: aSetter get: aGetter isExecutableBlock: aBlock [

	^ self new
		  name: aString;
		  setBlock: aSetter;
		  getBlock: aGetter;
		  isExecutableBlock: aBlock;
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
		  isExecutableBlock: [ :obj :state| obj isKindOf: BlElement ]
]

{ #category : #adding }
PyramidCommand class >> removeElementOnCollection [

	^ self
		  name: #removeElementOnCollection
		  set: [ :state :target | target removeAll: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source elements asArray ]
		  isExecutableBlock: [ :obj :state| obj isCollection ]
]

{ #category : #adding }
PyramidCommand class >> set: aSetter get: aGetter isExecutableBlock: aBlock [

	^ self new
		  name: #'Anonymous command';
		  setBlock: aSetter;
		  getBlock: aGetter;
		  isExecutableBlock: aBlock;
		  yourself
]

{ #category : #adding }
PyramidCommand class >> visibility [

	^ self
		  name: #visibility
		  set: [ :state :target | target visibility: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source visibility ]
		  isExecutableBlock: [ :obj :state | (obj isKindOf: BlElement) and: [ state arguments ~= obj visibility ] ]
]

{ #category : #operations }
PyramidCommand >> copyWithoutState [

	| command |
	command := self class new.
	command setBlock: self setBlock.
	command getBlock: self getBlock.
	command name: self name.
	command isExecutableBlock: self isExecutableBlock.
	^ command
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

{ #category : #initialization }
PyramidCommand >> getStateFrom: aSource [

	| newState |
	newState := PyramidCommandState new.
	self getState: newState from: aSource.
	^ newState
]

{ #category : #accessing }
PyramidCommand >> isExecutableBlock [
	^ isExecutableBlock 
]

{ #category : #accessing }
PyramidCommand >> isExecutableBlock: aBlock [

	isExecutableBlock:= aBlock
]

{ #category : #testing }
PyramidCommand >> isExecutableBy: anObject [

	^ self isExecutableBlock value: anObject value: self state
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
