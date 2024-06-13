Class {
	#name : 'PyramidFrameHorizontalConstraintsCommand',
	#superclass : 'PyramidFrameConstraintsCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'as yet unclassified' }
PyramidFrameHorizontalConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints frame horizontal alignment
]

{ #category : 'as yet unclassified' }
PyramidFrameHorizontalConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraintsDo: [ :c |
		c frame horizontal alignment: anArgument. ]
]
