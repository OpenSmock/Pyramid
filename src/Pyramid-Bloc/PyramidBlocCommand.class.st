Class {
	#name : #PyramidBlocCommand,
	#superclass : #PyramidCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #testing }
PyramidBlocCommand class >> isAbstract [

	^ self == PyramidBlocCommand
]

{ #category : #testing }
PyramidBlocCommand >> canBeUsedFor: anObject [

	^ anObject class = BlElement or: [anObject class inheritsFrom: BlElement]
]
