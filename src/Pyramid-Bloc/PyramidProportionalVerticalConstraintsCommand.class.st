Class {
	#name : #PyramidProportionalVerticalConstraintsCommand,
	#superclass : #PyramidProportionalConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #getter }
PyramidProportionalVerticalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints proportional vertical top
	  @ anObject constraints proportional vertical bottom
]

{ #category : #setter }
PyramidProportionalVerticalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c proportional vertical top: anArgument x.
		c proportional vertical bottom: anArgument y ]
]
