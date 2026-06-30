Class {
	#name : #PyramidFontWeightCommand,
	#superclass : #PyramidBlocTextCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-text'
}

{ #category : #getter }
PyramidFontWeightCommand >> getValueFor: aBlTextElement [

	aBlTextElement text attributesFinder findAttributesSuchThat: [ :a | a class = BlFontWeightAttribute ] indicesDo: [ :new :old :a | ^ a weight ].
	^ LogicalFont weightRegular
]

{ #category : #setter }
PyramidFontWeightCommand >> setValueFor: aBlTextElement with: aNumber [

	aBlTextElement text attribute:
		(BlFontWeightAttribute weight: aNumber).
	aBlTextElement textChanged
]
