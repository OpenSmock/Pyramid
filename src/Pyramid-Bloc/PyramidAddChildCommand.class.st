Class {
	#name : #PyramidAddChildCommand,
	#superclass : #PyramidChildrenCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidAddChildCommand >> commandInverse [

	^ PyramidRemoveChildCommand new
]

{ #category : #'as yet unclassified' }
PyramidAddChildCommand >> setValueFor: aBlElement with: aChildToAdd [
    | index |
    index := aChildToAdd userData at: #removedAtIndex ifAbsent: [ 0 ].
    (index = 0 or: [ index > aBlElement children size ])
        ifTrue: [ aBlElement addChild: aChildToAdd ]
        ifFalse: [ aBlElement addChild: aChildToAdd at: index ]
]
