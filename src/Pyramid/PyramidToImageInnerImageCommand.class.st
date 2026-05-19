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
PyramidToImageInnerImageCommand >> getValueFor: aToImage [

	| form |
	aToImage innerFormImage ifNil: [ ^ '' ].
	form := aToImage innerFormImage.
	^ Smalltalk ui icons allIconNames
		  detect: [ :name | (Smalltalk ui icons iconNamed: name) = form ]
		  ifNone: [ '' ]
]

{ #category : #setter }
PyramidToImageInnerImageCommand >> setValueFor: aToImage with: aSymbol [

	aToImage innerImage: (Smalltalk ui icons iconNamed: aSymbol)
]
