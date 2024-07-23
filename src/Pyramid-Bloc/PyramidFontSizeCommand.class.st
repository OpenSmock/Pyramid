Class {
	#name : #PyramidFontSizeCommand,
	#superclass : #PyramidBlocTextCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-text'
}

{ #category : #'as yet unclassified' }
PyramidFontSizeCommand >> getValueFor: aBlTextElement [

	aBlTextElement text attributesFinder
		findAttributesSuchThat: [ :a | a class = BlFontSizeAttribute ]
		indicesDo: [ :new :old :a | ^ a size ].
		self flag: #TODO. "I put 10 as a default font size. I don't know where this information come from."
			^ 10
]

{ #category : #'as yet unclassified' }
PyramidFontSizeCommand >> setValueFor: aBlTextElement with: aNumber [

	aBlTextElement text attribute: (BlFontSizeAttribute size: aNumber).
	aBlTextElement textChanged
]
