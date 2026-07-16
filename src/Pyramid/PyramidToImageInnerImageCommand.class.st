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

	^ aToImage userData at: #pyramidIconName ifAbsent: [ '' ]
]

{ #category : #setter }
PyramidToImageInnerImageCommand >> setValueFor: aToImage with: aSymbol [

	iconName := aSymbol.
	aToImage extent isZero ifTrue: [ aToImage extent: 48 asPoint ].
	aToImage innerImage:
		(PyramidIconInputPresenter innerElementFromName: aSymbol)
]
