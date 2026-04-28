Class {
	#name : #PyramidAddChildrenCommand,
	#superclass : #PyramidChildrenCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #history }
PyramidAddChildrenCommand >> commandInverse [

	^ PyramidRemoveChildrenCommand new
]

{ #category : #setter }
PyramidAddChildrenCommand >> setValueFor: aBlElement with: aChildrenToAdd [
    aChildrenToAdd do: [ :child |
        aBlElement addChild: child ]
]
