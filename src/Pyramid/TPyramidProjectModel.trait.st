Trait {
	#name : 'TPyramidProjectModel',
	#instVars : [
		'observers'
	],
	#category : 'Pyramid-models',
	#package : 'Pyramid',
	#tag : 'models'
}

{ #category : 'adding' }
TPyramidProjectModel >> addObserver: anObserver [
	self observers add: anObserver
]

{ #category : 'as yet unclassified' }
TPyramidProjectModel >> informElementsChanged [

	self observers do: [ :each | each pyramidElementsChanged ]
]

{ #category : 'as yet unclassified' }
TPyramidProjectModel >> informFirstLevelElementsChanged [

	self observers do: [ :each | each pyramidFirstLevelElementsChanged ]
]

{ #category : 'as yet unclassified' }
TPyramidProjectModel >> informSelectionChanged [

	self observers do: [ :each | each pyramidSelectionChanged ]
]

{ #category : 'adding' }
TPyramidProjectModel >> observers [

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : 'adding' }
TPyramidProjectModel >> removeObserver: anObserver [

	self observers remove: anObserver
]
