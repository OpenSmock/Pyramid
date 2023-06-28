Trait {
	#name : #TPyramidProjectModel,
	#instVars : [
		'observers'
	],
	#category : #'Pyramid-models'
}

{ #category : #adding }
TPyramidProjectModel >> addObserver: anObserver [
	self observers add: anObserver
]

{ #category : #'as yet unclassified' }
TPyramidProjectModel >> informRootsChanged [

	self observers do: [ :each | each pyramidRootsChanged ]
]

{ #category : #'as yet unclassified' }
TPyramidProjectModel >> informSelectionChanged [

	self observers do: [ :each | each pyramidSelectionChanged ]
]

{ #category : #adding }
TPyramidProjectModel >> observers [

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPyramidProjectModel >> removeObserver: anObserver [

	self observers remove: anObserver
]
