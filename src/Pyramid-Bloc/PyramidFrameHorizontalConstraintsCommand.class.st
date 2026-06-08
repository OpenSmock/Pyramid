Class {
	#name : #PyramidFrameHorizontalConstraintsCommand,
	#superclass : #PyramidFrameConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #getter }
PyramidFrameHorizontalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints frame horizontal alignment
]

{ #category : #setter }
PyramidFrameHorizontalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c frame horizontal alignment: anArgument. ]
]
