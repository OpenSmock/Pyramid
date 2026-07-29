Class {
	#name : #PyramidToButtonIconCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-editor'
}

{ #category : #testing }
PyramidToButtonIconCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject class = ToButton ]
]

{ #category : #getter }
PyramidToButtonIconCommand >> getValueFor: aToButton [
	^ (PyramidMainExtension iconNameForElementId: aToButton id , '_icon') ifNil: [ '' ]


]

{ #category : #setter }
PyramidToButtonIconCommand >> setValueFor: aToButton with: aSymbol [

	aToButton icon: (PyramidIconInputPresenter toImageFromName: aSymbol).
	PyramidMainExtension
		addIconName: aSymbol
		forElementId: aToButton id , '_icon'
]
