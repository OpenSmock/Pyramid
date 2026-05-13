Class {
	#name : #PyramidToButtonIconCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'lastIconName'
	],
	#category : #'Pyramid-plugin-element'
}

{ #category : #testing }
PyramidToButtonIconCommand >> canBeUsedFor: anObject [
    ^ anObject class = ToButton
]

{ #category : #getter }
PyramidToButtonIconCommand >> getValueFor: aToButton [
    ^ lastIconName ifNil: [ '' ]
]

{ #category : #setter }
PyramidToButtonIconCommand >> setValueFor: aToButton with: aSymbol [

	lastIconName := aSymbol.
	aToButton iconImage: (Smalltalk ui icons iconNamed: aSymbol)
]
