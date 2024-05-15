Class {
	#name : 'PyramidAbstractBlocCommand',
	#superclass : 'PyramidCommand',
	#category : 'Pyramid-Bloc-plugin-bloc',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc'
}

{ #category : 'testing' }
PyramidAbstractBlocCommand class >> isAbstract [

	^ self == PyramidAbstractBlocCommand
]

{ #category : 'testing' }
PyramidAbstractBlocCommand >> canBeUsedFor: anObject [

	^ anObject class = BlElement or: [anObject class inheritsFrom: BlElement]
]
