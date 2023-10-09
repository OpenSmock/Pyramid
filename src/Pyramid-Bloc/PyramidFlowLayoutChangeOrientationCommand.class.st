Class {
	#name : 'PyramidFlowLayoutChangeOrientationCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'testing' }
PyramidFlowLayoutChangeOrientationCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject layout class == BlFlowLayout ]
]

{ #category : 'as yet unclassified' }
PyramidFlowLayoutChangeOrientationCommand >> getValueFor: anObject [

	^ anObject layout orientation
]

{ #category : 'as yet unclassified' }
PyramidFlowLayoutChangeOrientationCommand >> setValueFor: anObject with: anArgument [

	anObject layout orientation: anArgument
]
