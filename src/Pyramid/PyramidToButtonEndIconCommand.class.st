Class {
	#name : #PyramidToButtonEndIconCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToButtonEndIconCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject class = ToButton ]
]

{ #category : #getter }
PyramidToButtonEndIconCommand >> getValueFor: aToButton [
    ^ (PyramidMainExtension currentProjectIcons
        at: aToButton id , '_endIcon' ifAbsent: [ nil ])
        ifNil: [ '' ]
]

{ #category : #setter }
PyramidToButtonEndIconCommand >> setValueFor: aToButton with: aSymbol [

	aToButton endIcon:
		(PyramidIconInputPresenter toImageFromName: aSymbol).
	PyramidMainExtension
		addIconName: aSymbol
		forElementId: aToButton id , '_endIcon'
]
