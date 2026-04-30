Class {
	#name : #PyramidProportionalHorizontalConstraintsCommand,
	#superclass : #PyramidProportionalConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #getter }
PyramidProportionalHorizontalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints proportional horizontal left
	  @ anObject constraints proportional horizontal right
]

{ #category : #setter }
PyramidProportionalHorizontalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c proportional horizontal left: anArgument x.
		c proportional horizontal right: anArgument y ]
]
