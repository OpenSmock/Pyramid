Class {
	#name : #PyramidFrameVerticalConstraintsCommand,
	#superclass : #PyramidFrameConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidFrameVerticalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints frame vertical alignment
]

{ #category : #'as yet unclassified' }
PyramidFrameVerticalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c frame vertical alignment: anArgument ]
]
