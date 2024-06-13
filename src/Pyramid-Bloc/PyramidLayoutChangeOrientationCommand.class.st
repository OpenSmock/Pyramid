Class {
	#name : 'PyramidLayoutChangeOrientationCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'testing' }
PyramidLayoutChangeOrientationCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		   { BlFlowLayout . BlLinearLayout } includes: anObject layout class ]
]

{ #category : 'as yet unclassified' }
PyramidLayoutChangeOrientationCommand >> getValueFor: anObject [

	^ anObject layout orientation
]

{ #category : 'as yet unclassified' }
PyramidLayoutChangeOrientationCommand >> setValueFor: anObject with: anArgument [

	anObject layout orientation: anArgument
]
