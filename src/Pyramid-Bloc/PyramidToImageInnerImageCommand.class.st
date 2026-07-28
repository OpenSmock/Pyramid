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
        at: aToImage id , '_innerImage' ifAbsent: [ nil ])
        ifNil: [ '' ]
]

{ #category : #setter }
PyramidToImageInnerImageCommand >> setValueFor: aToImage with: aSymbol [

	aToImage innerImage:
		(PyramidIconInputPresenter innerElementFromName: aSymbol).
	PyramidMainExtension
		addIconName: aSymbol
		forElementId: aToImage id , '_innerImage'
]
