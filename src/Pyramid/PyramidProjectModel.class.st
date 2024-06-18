Class {
	#name : 'PyramidProjectModel',
	#superclass : 'Object',
	#traits : 'TPyramidProjectModel',
	#classTraits : 'TPyramidProjectModel classTrait',
	#instVars : [
		'firstLevelElements',
		'selection'
	],
	#category : 'Pyramid-models',
	#package : 'Pyramid',
	#tag : 'models'
}

{ #category : 'accessing' }
PyramidProjectModel >> firstLevelElements [

	^ firstLevelElements
]

{ #category : 'accessing' }
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

{ #category : 'selection' }
PyramidProjectModel >> selection [

	^ selection
]

{ #category : 'selection' }
PyramidProjectModel >> setSelection: aBlElementCollection [
	"Replace current selection by another one"
	
	self selection replaceAll: aBlElementCollection
]

{ #category : 'selection' }
PyramidProjectModel >> updateSelection [
	"Update the selection list regarding existing elements"
	
	| toBeRemovedFromSelectionElements |
	"Select not attached to scene or without parents elements (this is the status after a deletion)"
	toBeRemovedFromSelectionElements := self selection collection select:[ :e | e hasParent not or:[ e isAttachedToSceneGraph ] ].
	
	self selection removeAll: toBeRemovedFromSelectionElements.
	
	
]
