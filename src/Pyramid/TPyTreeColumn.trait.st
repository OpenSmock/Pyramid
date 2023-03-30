Trait {
	#name : #TPyTreeColumn,
	#instVars : [
		'column'
	],
	#traits : 'TPyramidBusinessUser',
	#classTraits : 'TPyramidBusinessUser classTrait',
	#category : #'Pyramid-Editor-Tree'
}

{ #category : #comparing }
TPyTreeColumn >> <= aTPyTreeColumn [

	^ self order <= aTPyTreeColumn order
]

{ #category : #accessing }
TPyTreeColumn >> column [

	^ column
]

{ #category : #accessing }
TPyTreeColumn >> order [
	^ 0
]
