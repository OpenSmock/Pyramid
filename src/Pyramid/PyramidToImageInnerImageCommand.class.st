Class {
	#name : #PyramidToImageInnerImageCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToImageInnerImageCommand >> canBeUsedFor: anObject [
    ^ (super canBeUsedFor: anObject) and: [ anObject class = ToImage ]
]

{ #category : #getter }
PyramidToImageInnerImageCommand >> getValueFor: anObject [
    anObject innerFormImage ifNil: [ ^ '' ].
    ^ Smalltalk ui icons allIconNames
        detect: [ :name | (Smalltalk ui icons iconNamed: name) = anObject innerFormImage ]
        ifNone: [ '' ]
]

{ #category : #setter }
PyramidToImageInnerImageCommand >> setValueFor: anObject with: aSymbol [
    anObject innerImage: (Smalltalk ui icons iconNamed: aSymbol)
]
