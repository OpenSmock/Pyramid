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
	#category : #'Pyramid-commands'
}

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
PyramidCommand class >> set: aSetter get: aGetter isExecutableBlock: aBlock [

	^ self new
		  name: #'Anonymous command';
		  setBlock: aSetter;
		  getBlock: aGetter;
		  isExecutableBlock: aBlock;
		  yourself
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
