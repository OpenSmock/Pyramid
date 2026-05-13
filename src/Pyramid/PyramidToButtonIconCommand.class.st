Class {
	#name : #PyramidToButtonIconCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-element'
}

{ #category : #testing }
PyramidToButtonIconCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject class = ToButton ]
]

{ #category : #getter }
PyramidToButtonIconCommand >> getValueFor: aToButton [

	| form |
	aToButton icon ifNil: [ ^ '' ].
	form := aToButton icon image innerFormImage.
	^ Smalltalk ui icons allIconNames
		  detect: [ :name | (Smalltalk ui icons iconNamed: name) = form ]
		  ifNone: [ '' ]
]

{ #category : #setter }
PyramidToButtonIconCommand >> setValueFor: aToButton with: aSymbol [

	| icon |
	icon := ToIcon new.
	icon iconImage: (Smalltalk ui icons iconNamed: aSymbol).
	aToButton icon: icon
]
