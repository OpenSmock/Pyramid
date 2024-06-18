Class {
	#name : 'PyramidProjectModelObserverForTest',
	#superclass : 'Object',
	#instVars : [
		'pyramidElementsChangedAction',
		'pyramidFirstLevelElementsChangedAction',
		'pyramidSelectionChangedAction'
	],
	#category : 'Pyramid-Tests-cases-models',
	#package : 'Pyramid-Tests',
	#tag : 'cases-models'
}

{ #category : 'initialization' }
PyramidProjectModelObserverForTest >> initialize [

	self pyramidElementsChangedAction: [ :evt | ].
	self pyramidFirstLevelElementsChangedAction: [ :evt | ].
	self pyramidSelectionChangedAction: [ :evt | ]
]

{ #category : 'as yet unclassified' }
PyramidProjectModelObserverForTest >> pyramidElementsChanged: anEvent [

	self pyramidElementsChangedAction value: anEvent
]

{ #category : 'as yet unclassified' }
PyramidProjectModelObserverForTest >> pyramidElementsChangedAction [

	^ pyramidElementsChangedAction
]

{ #category : 'accessing' }
PyramidProjectModelObserverForTest >> pyramidElementsChangedAction: anObject [

	pyramidElementsChangedAction := anObject
]

{ #category : 'as yet unclassified' }
PyramidProjectModelObserverForTest >> pyramidFirstLevelElementsChanged: anEvent [

	self pyramidFirstLevelElementsChangedAction value: anEvent
]

{ #category : 'accessing' }
PyramidProjectModelObserverForTest >> pyramidFirstLevelElementsChangedAction [

	^ pyramidFirstLevelElementsChangedAction
]

{ #category : 'accessing' }
PyramidProjectModelObserverForTest >> pyramidFirstLevelElementsChangedAction: anObject [

	pyramidFirstLevelElementsChangedAction := anObject
]

{ #category : 'as yet unclassified' }
PyramidProjectModelObserverForTest >> pyramidSelectionChanged: anEvent [

	self pyramidSelectionChangedAction value: anEvent
]

{ #category : 'accessing' }
PyramidProjectModelObserverForTest >> pyramidSelectionChangedAction [

	^ pyramidSelectionChangedAction
]

{ #category : 'accessing' }
PyramidProjectModelObserverForTest >> pyramidSelectionChangedAction: anObject [

	pyramidSelectionChangedAction := anObject
]
