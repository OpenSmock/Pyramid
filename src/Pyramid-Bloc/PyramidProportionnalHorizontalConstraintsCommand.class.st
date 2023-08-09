Class {
	#name : #PyramidProportionnalHorizontalConstraintsCommand,
	#superclass : #PyramidProportionnalConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidProportionnalHorizontalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints horizontal left @ anObject constraints horizontal right
]

{ #category : #'as yet unclassified' }
PyramidProportionnalHorizontalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c horizontal left: anArgument x.
		c horizontal right: anArgument y ]
]
