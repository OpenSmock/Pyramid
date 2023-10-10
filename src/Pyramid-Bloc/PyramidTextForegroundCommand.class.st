Class {
	#name : #PyramidTextForegroundCommand,
	#superclass : #PyramidBlocTextCommand,
	#category : 'Pyramid-Bloc-plugin-bloc-text'
}

{ #category : #'as yet unclassified' }
PyramidTextForegroundCommand >> getValueFor: aBlTextElement [

	aBlTextElement text attributesFinder
		findAttributesSuchThat: [ :a | a class = BlTextForegroundAttribute ]
		indicesDo: [ :new :old :a | ^ a paint ].
	self flag: #TODO. "I dont know why black is default color."
	^ Color black
]

{ #category : #'as yet unclassified' }
PyramidTextForegroundCommand >> setValueFor: aBlTextElement with: aColor [

	aBlTextElement text attribute:
		(BlTextForegroundAttribute paint: aColor)
]
