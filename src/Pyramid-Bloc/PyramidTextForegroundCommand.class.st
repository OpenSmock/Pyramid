Class {
	#name : #PyramidTextForegroundCommand,
	#superclass : #PyramidBlocTextCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-text'
}

{ #category : #getter }
PyramidTextForegroundCommand >> getValueFor: aBlTextElement [

	aBlTextElement text attributesFinder
		findAttributesSuchThat: [ :a | a class = BlTextForegroundAttribute ]
		indicesDo: [ :new :old :a | ^ a paint ].
	self flag: #TODO. "I dont know why black is default color."
	^ Color black
]

{ #category : #setter }
PyramidTextForegroundCommand >> setValueFor: aBlTextElement with: aColor [

	aBlTextElement text attribute:
		(BlTextForegroundAttribute paint: aColor).
	aBlTextElement textChanged
]
