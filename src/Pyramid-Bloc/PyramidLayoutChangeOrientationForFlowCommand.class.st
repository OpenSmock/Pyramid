Class {
	#name : #PyramidLayoutChangeOrientationForFlowCommand,
	#superclass : #PyramidLayoutChangeOrientationCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #testing }
PyramidLayoutChangeOrientationForFlowCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  
			  BlFlowLayout  = anObject layout class ]
]
