Class {
	#name : 'PyramidLayoutChangeOrientationForLinearCommand',
	#superclass : 'PyramidLayoutChangeOrientationCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'testing' }
PyramidLayoutChangeOrientationForLinearCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  BlLinearLayout = anObject layout class ]
]
