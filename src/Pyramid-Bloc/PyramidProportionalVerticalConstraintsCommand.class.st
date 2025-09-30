Class {
	#name : #PyramidProportionalVerticalConstraintsCommand,
	#superclass : #PyramidProportionalConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidProportionalVerticalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints proportional vertical top
	  @ anObject constraints proportional vertical bottom
]

{ #category : #'as yet unclassified' }
PyramidProportionalVerticalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c proportional vertical top: anArgument x.
		c proportional vertical bottom: anArgument y ]
]
