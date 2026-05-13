Class {
	#name : #PyramidToImageInnerImageCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'lastInnerImage'
	],
	#category : #'Pyramid-plugin-element'
}

{ #category : #testing }
PyramidToImageInnerImageCommand >> canBeUsedFor: anObject [

	^ anObject class = ToImage
]

{ #category : #getter }
PyramidToImageInnerImageCommand >> getValueFor: aToImage [

    ^ lastInnerImage ifNil: [ '' ]
]

{ #category : #setter }
PyramidToImageInnerImageCommand >> setValueFor: aToImage with: aSymbol [

    lastInnerImage := aSymbol.
    aToImage innerImage: (Smalltalk ui icons iconNamed: aSymbol)
]
