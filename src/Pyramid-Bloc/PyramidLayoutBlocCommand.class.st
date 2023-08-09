Class {
	#name : #PyramidLayoutBlocCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidLayoutBlocCommand >> getValueFor: anObject [

	^ anObject layout
]

{ #category : #'as yet unclassified' }
PyramidLayoutBlocCommand >> setValueFor: anObject with: anArgument [

	anObject layout: anArgument
]
