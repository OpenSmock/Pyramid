Class {
	#name : #PyramidBackgroundTypeCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBackgroundTypeCommand >> getGroupedValueFor: aBlElement [

	^ aBlElement background class
]

{ #category : #getter }
PyramidBackgroundTypeCommand >> getValueFor: aBlElement [

	^ aBlElement background
]

{ #category : #setter }
PyramidBackgroundTypeCommand >> setValueFor: aBlElement with: anArgument [
	"Must be a blockClosure to ensure no background are created."

	aBlElement background: anArgument value value
]
