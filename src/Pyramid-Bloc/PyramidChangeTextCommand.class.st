Class {
	#name : #PyramidChangeTextCommand,
	#superclass : #PyramidBlocTextCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-text'
}

{ #category : #'as yet unclassified' }
PyramidChangeTextCommand >> getValueFor: aBlTextElement [

	^ aBlTextElement text asString
]

{ #category : #'as yet unclassified' }
PyramidChangeTextCommand >> setValueFor: aBlTextElement with: aString [

	| attributes rope |
	attributes := self getAttributesOf: aBlTextElement text.
	rope := aString asRopedText.
	
	attributes do: [ :a | rope attribute: a ].
	aBlTextElement text: rope
]
