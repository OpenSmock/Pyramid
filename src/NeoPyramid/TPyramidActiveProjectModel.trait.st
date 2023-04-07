Trait {
	#name : #TPyramidActiveProjectModel,
	#instVars : [
		'observers'
	],
	#category : #'NeoPyramid-models'
}

{ #category : #adding }
TPyramidActiveProjectModel >> addObserver: anObserver [
	self observers add: anObserver
]

{ #category : #'as yet unclassified' }
TPyramidActiveProjectModel >> informActiveProjectChanged [

	self observers do: [ :each | each pyramidActiveProjectChangedChanged ]
]

{ #category : #'as yet unclassified' }
TPyramidActiveProjectModel >> informRootsChangedOnActiveProject [

	self observers do: [ :each | each pyramidRootsChangedOnActiveProject ]
]

{ #category : #'as yet unclassified' }
TPyramidActiveProjectModel >> informSelectionChangedOnActiveProject [

	self observers do: [ :each | each pyramidSelectionChangedOnActiveProject ]
]

{ #category : #adding }
TPyramidActiveProjectModel >> observers [

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPyramidActiveProjectModel >> removeObserver: anObserver [

	self observers remove: anObserver
]
