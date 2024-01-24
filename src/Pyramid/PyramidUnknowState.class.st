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
PyramidUnknowState >> asBooleanForPyramid [

	^ self
]

{ #category : #converting }
PyramidUnknowState >> asColor [

	^ Color transparent
]

{ #category : #converting }
PyramidUnknowState >> asIcon [

	^ self iconNamed: #comments
]

{ #category : #converting }
PyramidUnknowState >> asOrientationForPyramid [

	^ self
]

{ #category : #converting }
PyramidUnknowState >> asPyramidConstraintsArgument [

	^ self
]

{ #category : #converting }
PyramidUnknowState >> asString [

	^ '@ Unknow state'
]

{ #category : #'as yet unclassified' }
PyramidUnknowState >> pyramidSelectOn: anInput [

	anInput unselectAll
]

{ #category : #initialization }
PyramidUnknowState >> setConstraintsOn: aPyramidBasicConstraintsInputPresenter [

	aPyramidBasicConstraintsInputPresenter setUnknowValue
]

{ #category : #initialization }
PyramidUnknowState >> setCornerRadiiOn: aPyramidCornerRadiiInputPresenter [

	aPyramidCornerRadiiInputPresenter inputArray value: self
]

{ #category : #initialization }
PyramidUnknowState >> setInsetsOn: aPyramidInsetsInputPresenter [

	aPyramidInsetsInputPresenter inputArray value: self
]

{ #category : #initialization }
PyramidUnknowState >> setLayoutOn: aPyramidLayoutInputPresenter [

	aPyramidLayoutInputPresenter setUnknowValue
]
