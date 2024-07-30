Class {
	#name : #PyramidAbstractBlocCommand,
	#superclass : #PyramidCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #testing }
PyramidAbstractBlocCommand class >> isAbstract [

	^ self == PyramidAbstractBlocCommand
]

{ #category : #testing }
PyramidAbstractBlocCommand >> canBeUsedFor: anObject [

	^ anObject isKindOf: BlElement 
]
