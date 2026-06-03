Class {
	#name : #PyramidToImageInnerImageCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'iconName'
	],
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToImageInnerImageCommand >> canBeUsedFor: anObject [
    ^ (super canBeUsedFor: anObject) and: [ anObject class = ToImage ]
]

{ #category : #getter }
PyramidToImageInnerImageCommand >> getValueFor: aToImage [

	^ iconName ifNil: [ ^ '' ]
]

{ #category : #setter }
PyramidToImageInnerImageCommand >> setValueFor: aToImage with: aSymbol [

	iconName := aSymbol.
	aToImage innerImage: (PyramidIconInputPresenter toImageFromName: aSymbol)
]
