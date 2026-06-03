Class {
	#name : #PyramidToButtonEndIconCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'endIconName'
	],
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToButtonEndIconCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject class = ToButton ]
]

{ #category : #getter }
PyramidToButtonEndIconCommand >> getValueFor: aToButton [

	^ endIconName ifNil: [ ^ '' ]
]

{ #category : #setter }
PyramidToButtonEndIconCommand >> setValueFor: aToButton with: aSymbol [

	endIconName := aSymbol.
	aToButton endIcon: (PyramidIconInputPresenter toImageFromName: aSymbol)
]
