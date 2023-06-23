Class {
	#name : #PyramidSelectionMakerCtrlKeyStrategy,
	#superclass : #PyramidSelectionMakerStrategy,
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #'as yet unclassified' }
PyramidSelectionMakerCtrlKeyStrategy >> computeNewSelection: newCollection fromPrevious: oldCollection [

	^ newCollection | oldCollection \ (newCollection & oldCollection)
]
