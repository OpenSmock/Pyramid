Class {
	#name : 'PyramidAddChildCommand',
	#superclass : 'PyramidChildrenCommand',
	#category : 'Pyramid-Bloc-plugin-bloc',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc'
}

{ #category : 'as yet unclassified' }
PyramidAddChildCommand >> commandInverse [

	^ PyramidRemoveChildCommand new
]

{ #category : 'as yet unclassified' }
PyramidAddChildCommand >> setValueFor: aBlElement with: aChildToAdd [

	aBlElement addChild: aChildToAdd
]
