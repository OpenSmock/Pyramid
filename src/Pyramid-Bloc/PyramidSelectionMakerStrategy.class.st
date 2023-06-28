Class {
	#name : #PyramidSelectionMakerStrategy,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #'as yet unclassified' }
PyramidSelectionMakerStrategy >> changeSelection: aTarget with: aCollection [

	| copySelection |
	copySelection := aTarget asArray.
	aTarget replaceAll:
		(self computeNewSelection: aCollection fromPrevious: copySelection)
]

{ #category : #'as yet unclassified' }
PyramidSelectionMakerStrategy >> computeNewSelection: newCollection fromPrevious: oldCollection [

	^ self shouldBeImplemented
]
