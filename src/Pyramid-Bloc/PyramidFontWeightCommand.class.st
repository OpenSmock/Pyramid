Class {
	#name : #PyramidFontWeightCommand,
	#superclass : #PyramidBlocTextCommand,
	#category : 'Pyramid-Bloc-plugin-bloc-text'
}

{ #category : #'as yet unclassified' }
PyramidFontWeightCommand >> getValueFor: aBlTextElement [

	aBlTextElement text attributesFinder findAttributesSuchThat: [ :a | a class = BlFontWeightAttribute ] indicesDo: [ :new :old :a | ^ a weight ].
	^ LogicalFont weightRegular
]

{ #category : #'as yet unclassified' }
PyramidFontWeightCommand >> setValueFor: aBlTextElement with: aNumber [

	aBlTextElement text attribute:
		(BlFontWeightAttribute weight: aNumber)
]
