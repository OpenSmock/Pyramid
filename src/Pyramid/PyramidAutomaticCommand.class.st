Class {
	#name : #PyramidAutomaticCommand,
	#superclass : #PyramidCommand,
	#instVars : [
		'validationBlock'
	],
	#category : #'Pyramid-commands'
}

{ #category : #testing }
PyramidAutomaticCommand class >> isAbstract [

	^ self == PyramidAutomaticCommand
]

{ #category : #testing }
PyramidAutomaticCommand >> canBeUsedFor: anObject [

	^ self validationBlock value: anObject
]

{ #category : #accessing }
PyramidAutomaticCommand >> validationBlock [

	^ validationBlock
]

{ #category : #accessing }
PyramidAutomaticCommand >> validationBlock: anObject [

	validationBlock := anObject
]
