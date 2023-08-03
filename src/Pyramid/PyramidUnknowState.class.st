Class {
	#name : #PyramidUnknowState,
	#superclass : #Object,
	#category : #'Pyramid-specs-custom'
}

{ #category : #comparing }
PyramidUnknowState >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #converting }
PyramidUnknowState >> asBlBackground [

	^ self
]

{ #category : #converting }
PyramidUnknowState >> asColor [

	^ Color transparent
]

{ #category : #converting }
PyramidUnknowState >> asString [

	^ '@ Unknow state'
]

{ #category : #initialization }
PyramidUnknowState >> setInsetsOn: aPyramidInsetsInputPresenter [

	aPyramidInsetsInputPresenter setUnknowModeWithState: self
]
