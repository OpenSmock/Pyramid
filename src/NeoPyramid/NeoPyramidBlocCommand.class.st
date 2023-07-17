Class {
	#name : #NeoPyramidBlocCommand,
	#superclass : #NeoPyramidCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #testing }
NeoPyramidBlocCommand >> canBeUsedFor: anObject [

	^ anObject class = BlElement or: [anObject class inheritsFrom: BlElement]
]
