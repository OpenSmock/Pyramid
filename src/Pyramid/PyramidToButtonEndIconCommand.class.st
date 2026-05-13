Class {
	#name : #PyramidToButtonEndIconCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'lastEndIconName'
	],
	#category : #'Pyramid-plugin-element'
}

{ #category : #testing }
PyramidToButtonEndIconCommand >> canBeUsedFor: anObject [

	^ anObject class = ToButton
]

{ #category : #getter }
PyramidToButtonEndIconCommand >> getValueFor: aToButton [

	^ lastEndIconName ifNil: [ '' ]
]

{ #category : #setter }
PyramidToButtonEndIconCommand >> setValueFor: aToButton with: aSymbol [
    | icon |
    lastEndIconName := aSymbol.
    icon := ToIcon new.
    icon iconImage: (Smalltalk ui icons iconNamed: aSymbol).
    aToButton endIcon: icon
]
