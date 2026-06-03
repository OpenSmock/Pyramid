Class {
	#name : #PyramidToButtonIconCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'iconName'
	],
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToButtonIconCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject class = ToButton ]
]

{ #category : #getter }
PyramidToButtonIconCommand >> getValueFor: aToButton [

	^ iconName ifNil: [ ^ '' ]

]

{ #category : #setter }
PyramidToButtonIconCommand >> setValueFor: aToButton with: aSymbol [

	iconName := aSymbol.
	aToButton icon: (PyramidIconInputPresenter toImageFromName: aSymbol)
]
