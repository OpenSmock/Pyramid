Class {
	#name : #PyramidEditorCommand,
	#superclass : #PyramidCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #testing }
PyramidEditorCommand class >> isAbstract [

	^ self == PyramidEditorCommand
]

{ #category : #testing }
PyramidEditorCommand >> canBeUsedFor: anObject [

	^ anObject class usesTrait: TPyramidProjectModel
]
