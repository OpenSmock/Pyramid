Class {
	#name : #PyramidProportionnalHorizontalConstraintsCommand,
	#superclass : #PyramidProportionnalConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidProportionnalHorizontalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints proportional horizontal left
	  @ anObject constraints proportional horizontal right
]

{ #category : #'as yet unclassified' }
PyramidProportionnalHorizontalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c proportional horizontal left: anArgument x.
		c proportional horizontal right: anArgument y ]
]
