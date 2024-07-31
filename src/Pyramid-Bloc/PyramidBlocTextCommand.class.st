Class {
	#name : #PyramidBlocTextCommand,
	#superclass : #PyramidCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-text'
}

{ #category : #testing }
PyramidBlocTextCommand class >> isAbstract [

	^ self == PyramidBlocTextCommand
]

{ #category : #testing }
PyramidBlocTextCommand >> canBeUsedFor: anObject [

	^ anObject isKindOf: BlTextElement
]

{ #category : #'as yet unclassified' }
PyramidBlocTextCommand >> getAttributesOf: aBlText [

	^ (aBlText attributesFinder attributesAndIndicesSuchThat: [ :a | true ]) collect: [ :each | each key ].
]
