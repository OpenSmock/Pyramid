Class {
	#name : #PyramidLayoutBlocCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #getter }
PyramidLayoutBlocCommand >> getValueFor: anObject [

	^ anObject layout
]

{ #category : #setter }
PyramidLayoutBlocCommand >> setValueFor: anObject with: anArgument [

	anObject layout: anArgument
]
