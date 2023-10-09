Class {
	#name : 'PyramidProportionnalVerticalConstraintsCommand',
	#superclass : 'PyramidProportionnalConstraintsCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'as yet unclassified' }
PyramidProportionnalVerticalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints proportional vertical top
	  @ anObject constraints proportional vertical bottom
]

{ #category : 'as yet unclassified' }
PyramidProportionnalVerticalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c proportional vertical top: anArgument x.
		c proportional vertical bottom: anArgument y ]
]
