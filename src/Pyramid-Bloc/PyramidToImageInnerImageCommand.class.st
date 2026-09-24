Class {
	#name : #PyramidToImageInnerImageCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'iconName'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-editor'
}

{ #category : #testing }
PyramidToImageInnerImageCommand >> canBeUsedFor: anObject [
    ^ (super canBeUsedFor: anObject) and: [ anObject class = ToImage ]
]

{ #category : #getter }
PyramidToImageInnerImageCommand >> getValueFor: aToImage [

	^ (PyramidMainExtension currentProjectIcons
		   at: aToImage id asString, '_innerImage'
		   ifAbsent: [ nil ]) ifNil: [ '' ]
]

{ #category : #setter }
PyramidToImageInnerImageCommand >> setValueFor: aToImage with: aSymbol [

	| innerImage |
	innerImage := PyramidIconInputPresenter toImageFromName: aSymbol.
	innerImage constraints horizontal matchParent.
	innerImage constraints vertical matchParent.
	aToImage innerImage: innerImage.
	
	PyramidMainExtension
		addIconName: aSymbol
		forElementId: aToImage id asString, '_innerImage'
]
