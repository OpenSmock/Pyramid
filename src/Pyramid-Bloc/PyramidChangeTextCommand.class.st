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
	aBlTextElement text: rope.
	"Fix label color on theme change when label is create during the session without copy or open from save"
	aBlTextElement parent ifNil: [ ^ self ].
	(((aBlTextElement parent)class) name) = (#ToLabel)
	ifTrue: [ aBlTextElement parent text: aString asRopedText ]
]
