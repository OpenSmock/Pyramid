Class {
	#name : #PyramidProjectModel,
	#superclass : #Object,
	#instVars : [
		'editor',
		'firstLevelElements',
		'selection'
	],
	#category : #'Pyramid-models'
}

{ #category : #'as yet unclassified' }
PyramidProjectModel >> announce: anEvent [

	self announcer announce: anEvent
]

{ #category : #'as yet unclassified' }
PyramidProjectModel >> announcer [

	^ self editor announcer
]

{ #category : #accessing }
PyramidProjectModel >> editor [

	^ editor
]

{ #category : #accessing }
PyramidProjectModel >> editor: anObject [

	editor := anObject
]

{ #category : #accessing }
PyramidProjectModel >> firstLevelElements [

	^ firstLevelElements
]

{ #category : #'as yet unclassified' }
PyramidProjectModel >> informElementsChanged [

		self announce: (PyramidElementsChangedEvent new
				 firstLevelElements: self firstLevelElements;
				 selection: self selection;
				 yourself)
]

{ #category : #'as yet unclassified' }
PyramidProjectModel >> informFirstLevelElementsChanged [

	self announce: (PyramidFirstLevelElementsChangedEvent new
			 firstLevelElements: self firstLevelElements;
			 selection: self selection;
			 yourself)
]

{ #category : #'as yet unclassified' }
PyramidProjectModel >> informSelectionChanged [

	self announce: (PyramidSelectionChangedEvent new
			 firstLevelElements: self firstLevelElements;
			 selection: self selection;
			 yourself)
]

{ #category : #accessing }
PyramidProjectModel >> initialize [

	selection := PyramidCollectionWithCallbacks new.
	firstLevelElements := PyramidSortedCollectionWithCallbacks new.

	selection
		subscribe: self
		withCallback: [ self informSelectionChanged ].
	firstLevelElements
		subscribe: self
		withCallback: [ self informFirstLevelElementsChanged ]
]

{ #category : #selection }
PyramidProjectModel >> selection [

	^ selection
]

{ #category : #selection }
PyramidProjectModel >> setSelection: aBlElementCollection [
	"Replace current selection by another one"
	
	self selection replaceAll: aBlElementCollection
]

{ #category : #selection }
PyramidProjectModel >> updateSelection [
	"Update the selection list regarding existing elements"
	
	| toBeRemovedFromSelectionElements |
	"Select not attached to scene or without parents elements (this is the status after a deletion)"
	toBeRemovedFromSelectionElements := self selection collection select:[ :e | e hasParent not or:[ e isAttachedToSceneGraph ] ].
	
	self selection removeAll: toBeRemovedFromSelectionElements.
	
	
]
