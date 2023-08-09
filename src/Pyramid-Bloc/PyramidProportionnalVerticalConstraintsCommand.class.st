Class {
	#name : #PyramidProportionnalVerticalConstraintsCommand,
	#superclass : #PyramidProportionnalConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidProportionnalVerticalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints horizontal top
	  @ anObject constraints horizontal bottom
]

{ #category : #'as yet unclassified' }
PyramidProportionnalVerticalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c | c vertical top: anArgument x. c vertical bottom: anArgument y ]
]
