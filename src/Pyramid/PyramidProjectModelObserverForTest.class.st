Class {
	#name : #PyramidProjectModelObserverForTest,
	#superclass : #Object,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'pyramidElementsChangedAction',
		'pyramidFirstLevelElementsChangedAction',
		'pyramidSelectionChangedAction'
	],
	#category : #'Pyramid-plugin-playground'
}

{ #category : #initialization }
PyramidProjectModelObserverForTest >> initialize [ 

	self pyramidElementsChangedAction: [  ].
	self pyramidFirstLevelElementsChangedAction: [  ].self pyramidSelectionChangedAction: [  ]
]

{ #category : #'as yet unclassified' }
PyramidProjectModelObserverForTest >> pyramidElementsChanged [

	self pyramidElementsChangedAction value.
]

{ #category : #accessing }
PyramidProjectModelObserverForTest >> pyramidElementsChangedAction [

	^ pyramidElementsChangedAction
]

{ #category : #accessing }
PyramidProjectModelObserverForTest >> pyramidElementsChangedAction: anObject [

	pyramidElementsChangedAction := anObject
]

{ #category : #'as yet unclassified' }
PyramidProjectModelObserverForTest >> pyramidFirstLevelElementsChanged [

	self pyramidFirstLevelElementsChangedAction value
]

{ #category : #accessing }
PyramidProjectModelObserverForTest >> pyramidFirstLevelElementsChangedAction [

	^ pyramidFirstLevelElementsChangedAction
]

{ #category : #accessing }
PyramidProjectModelObserverForTest >> pyramidFirstLevelElementsChangedAction: anObject [

	pyramidFirstLevelElementsChangedAction := anObject
]

{ #category : #'as yet unclassified' }
PyramidProjectModelObserverForTest >> pyramidSelectionChanged [

	self pyramidSelectionChangedAction value
]

{ #category : #accessing }
PyramidProjectModelObserverForTest >> pyramidSelectionChangedAction [

	^ pyramidSelectionChangedAction
]

{ #category : #accessing }
PyramidProjectModelObserverForTest >> pyramidSelectionChangedAction: anObject [

	pyramidSelectionChangedAction := anObject
]
