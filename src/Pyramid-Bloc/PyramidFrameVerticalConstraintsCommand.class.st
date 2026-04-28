Class {
	#name : #PyramidFrameVerticalConstraintsCommand,
	#superclass : #PyramidFrameConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #getter }
PyramidFrameVerticalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints frame vertical alignment
]

{ #category : #setter }
PyramidFrameVerticalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c frame vertical alignment: anArgument ]
]
