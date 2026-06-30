Class {
	#name : #PyramidLayoutChangeOrientationCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #testing }
PyramidLayoutChangeOrientationCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		   { BlFlowLayout . BlLinearLayout } includes: anObject layout class ]
]

{ #category : #getter }
PyramidLayoutChangeOrientationCommand >> getValueFor: anObject [

	^ anObject layout orientation
]

{ #category : #setter }
PyramidLayoutChangeOrientationCommand >> setValueFor: anObject with: anArgument [

	anObject layout orientation: anArgument
]
