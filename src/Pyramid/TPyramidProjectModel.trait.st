Trait {
	#name : 'TPyramidProjectModel',
	#instVars : [
		'editor'
	],
	#classTraits : '{} + TraitedClass',
	#category : 'Pyramid-models',
	#package : 'Pyramid',
	#tag : 'models'
}

{ #category : 'as yet unclassified' }
TPyramidProjectModel >> announce: anEvent [

	self announcer announce: anEvent
]

{ #category : 'as yet unclassified' }
TPyramidProjectModel >> announcer [

	^ self editor announcer
]

{ #category : 'accessing' }
TPyramidProjectModel >> editor [

	^ editor
]

{ #category : 'accessing' }
TPyramidProjectModel >> editor: anObject [

	editor := anObject
]

{ #category : 'accessing' }
TPyramidProjectModel >> firstLevelElements [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
TPyramidProjectModel >> informElementsChanged [

	self announce: PyramidElementsChangedEvent new
]

{ #category : 'as yet unclassified' }
TPyramidProjectModel >> informFirstLevelElementsChanged [

	self announce: PyramidFirstLevelElementsChangedEvent new
]

{ #category : 'as yet unclassified' }
TPyramidProjectModel >> informSelectionChanged [

	self announce: PyramidSelectionChangedEvent new
]

{ #category : 'accessing' }
TPyramidProjectModel >> selection [

	^ self shouldBeImplemented
]
