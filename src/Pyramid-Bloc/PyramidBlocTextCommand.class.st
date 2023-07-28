Class {
	#name : #PyramidBlocTextCommand,
	#superclass : #PyramidCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-text'
}

{ #category : #testing }
PyramidBlocTextCommand class >> isAbstract [

	^ self == PyramidBlocTextCommand
]

{ #category : #testing }
PyramidBlocTextCommand >> canBeUsedFor: anObject [

	^ anObject class = BlTextElement or: [
		  anObject class inheritsFrom: BlTextElement ]
]
