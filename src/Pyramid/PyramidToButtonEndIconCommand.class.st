Class {
	#name : #PyramidToButtonEndIconCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-element'
}

{ #category : #testing }
PyramidToButtonEndIconCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject class = ToButton ]
]

{ #category : #getter }
PyramidToButtonEndIconCommand >> getValueFor: aToButton [
    | form |
    aToButton endIcon ifNil: [ ^ '' ].
    form := aToButton endIcon image innerFormImage.
    ^ Smalltalk ui icons allIconNames
        detect: [ :name | (Smalltalk ui icons iconNamed: name) = form ]
        ifNone: [ '' ]
]

{ #category : #setter }
PyramidToButtonEndIconCommand >> setValueFor: aToButton with: aSymbol [
    | icon |
    icon := ToIcon new.
    icon iconImage: (Smalltalk ui icons iconNamed: aSymbol).
    aToButton endIcon: icon.
]
