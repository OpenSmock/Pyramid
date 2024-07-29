Class {
	#name : #PyramidProjectModelTest,
	#superclass : #TestCase,
	#instVars : [
		'projectModel',
		'observer',
		'pyramidElementsChanged',
		'pyramidFirstLevelElementsChanged',
		'pyramidSelectionChanged'
	],
	#category : #'Pyramid-Tests-cases-models'
}

{ #category : #running }
PyramidProjectModelTest >> assertEventProperties: anEvent [

	self
		assert: anEvent firstLevelElements
		equals: projectModel firstLevelElements.
	self assert: anEvent selection equals: projectModel selection.
]

{ #category : #accessing }
PyramidProjectModelTest >> observer [

	^ observer
]

{ #category : #accessing }
PyramidProjectModelTest >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidProjectModelTest >> pyramidElementsChanged [

	^ pyramidElementsChanged
]

{ #category : #accessing }
PyramidProjectModelTest >> pyramidElementsChanged: anObject [

	pyramidElementsChanged := anObject
]

{ #category : #accessing }
PyramidProjectModelTest >> pyramidFirstLevelElementsChanged [

	^ pyramidFirstLevelElementsChanged
]

{ #category : #accessing }
PyramidProjectModelTest >> pyramidFirstLevelElementsChanged: anObject [

	pyramidFirstLevelElementsChanged := anObject
]

{ #category : #accessing }
PyramidProjectModelTest >> pyramidSelectionChanged [

	^ pyramidSelectionChanged
]

{ #category : #accessing }
PyramidProjectModelTest >> pyramidSelectionChanged: anObject [

	pyramidSelectionChanged := anObject
]

{ #category : #running }
PyramidProjectModelTest >> setUp [

	| editor |
	super setUp.
	editor := PyramidEditor new.
	projectModel := editor projectModel.
	observer := PyramidProjectModelObserverForTest new.

	observer projectModel: projectModel.

	projectModel firstLevelElements addAll: {
			BlElement new.
			BlElement new.
			BlElement new.
			BlElement new }.
	projectModel selection addAll: {
			BlElement new.
			BlElement new.
			BlElement new.
			BlElement new }.

	pyramidElementsChanged := false.
	pyramidFirstLevelElementsChanged := false.
	pyramidSelectionChanged := false.

	observer pyramidElementsChangedAction: [ :evt |
		self assertEventProperties: evt.
		pyramidElementsChanged := true ].
	observer pyramidFirstLevelElementsChangedAction: [ :evt |
		self assertEventProperties: evt.
		pyramidFirstLevelElementsChanged := true ].
	observer pyramidSelectionChangedAction: [ :evt |
		self assertEventProperties: evt.
		pyramidSelectionChanged := true ]
]

{ #category : #tests }
PyramidProjectModelTest >> testElementsChanged [

	self projectModel informElementsChanged.
	self assert: self pyramidElementsChanged.
	self deny: self pyramidFirstLevelElementsChanged.
	self deny: self pyramidSelectionChanged
	
]

{ #category : #tests }
PyramidProjectModelTest >> testFirstLevelElementsChanged1 [

	self projectModel firstLevelElements addAll: {
			BlElement new.
			BlElement new }.
	self deny: self pyramidElementsChanged.
	self assert: self pyramidFirstLevelElementsChanged.
	self deny: self pyramidSelectionChanged
]

{ #category : #tests }
PyramidProjectModelTest >> testFirstLevelElementsChanged2 [

	self projectModel firstLevelElements add: BlElement new.
	self deny: self pyramidElementsChanged.
	self assert: self pyramidFirstLevelElementsChanged.
	self deny: self pyramidSelectionChanged
]

{ #category : #tests }
PyramidProjectModelTest >> testFirstLevelElementsChanged3 [

	self projectModel selection add: BlElement new.
	self deny: self pyramidElementsChanged.
	self deny: self pyramidFirstLevelElementsChanged.
	self assert: self pyramidSelectionChanged
]

{ #category : #tests }
PyramidProjectModelTest >> testSelectionChanged1 [

	self projectModel selection add: BlElement new.
	self deny: self pyramidElementsChanged.
	self deny: self pyramidFirstLevelElementsChanged.
	self assert: self pyramidSelectionChanged
]

{ #category : #tests }
PyramidProjectModelTest >> testSelectionChanged2 [

	self projectModel selection addAll: {
			BlElement new.
			BlElement new }.
	self deny: self pyramidElementsChanged.
	self deny: self pyramidFirstLevelElementsChanged.
	self assert: self pyramidSelectionChanged
]

{ #category : #tests }
PyramidProjectModelTest >> testSelectionChanged3 [

	self projectModel firstLevelElements add: BlElement new.
	self deny: self pyramidElementsChanged.
	self assert: self pyramidFirstLevelElementsChanged.
	self deny: self pyramidSelectionChanged
]
