Class {
	#name : #PyramidUnknowState,
	#superclass : #Object,
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #comparing }
PyramidUnknowState >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #converting }
PyramidUnknowState >> asColor [

	^ Color transparent
]

{ #category : #converting }
PyramidUnknowState >> asString [

	^ '@ Unknow state'
]
