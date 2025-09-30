Class {
	#name : #PyramidProportionalHorizontalConstraintsCommand,
	#superclass : #PyramidProportionalConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidProportionalHorizontalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints proportional horizontal left
	  @ anObject constraints proportional horizontal right
]

{ #category : #'as yet unclassified' }
PyramidProportionalHorizontalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c proportional horizontal left: anArgument x.
		c proportional horizontal right: anArgument y ]
]
