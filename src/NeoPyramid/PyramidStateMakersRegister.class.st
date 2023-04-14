Class {
	#name : #PyramidStateMakersRegister,
	#superclass : #Object,
	#instVars : [
		'verificatorDict',
		'stateMakers'
	],
	#category : #'NeoPyramid-plugin-commands'
}

{ #category : #'as yet unclassified' }
PyramidStateMakersRegister >> getAllStateMakersFrom: aCollection [

	^ self stateMakers select: [ :each |
		each anyVerificatorsSatisfy: aCollection ]
]

{ #category : #'as yet unclassified' }
PyramidStateMakersRegister >> getStrictlyAllStateMakersFrom: aCollection [

	^ self stateMakers select: [ :each |
		each allVerificatorsSatisfy: aCollection ]
]

{ #category : #initialization }
PyramidStateMakersRegister >> initialize [

	stateMakers := OrderedCollection new
]

{ #category : #adding }
PyramidStateMakersRegister >> registerStateMaker: aStateMaker [

	self stateMakers add: aStateMaker
]

{ #category : #initialization }
PyramidStateMakersRegister >> stateMakers [

	^ stateMakers
]
