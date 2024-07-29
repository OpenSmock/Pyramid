Class {
	#name : #PyramidProjectModelObserverForTest,
	#superclass : #Object,
	#instVars : [
		'pyramidElementsChangedAction',
		'pyramidFirstLevelElementsChangedAction',
		'pyramidSelectionChangedAction'
	],
	#category : #'Pyramid-Tests-cases-models'
}

{ #category : #accessing }
PyramidProjectModelObserverForTest >> initialize [

	self pyramidElementsChangedAction: [ :evt |  ].
	self pyramidFirstLevelElementsChangedAction: [ :evt |  ].
	self pyramidSelectionChangedAction: [ :evt |  ]
]

{ #category : #accessing }
PyramidProjectModelObserverForTest >> projectModel: aProjectModel [

	aProjectModel announcer
		when: PyramidElementsChangedEvent
		send: #pyramidElementsChanged:
		to: self.
	aProjectModel announcer
		when: PyramidFirstLevelElementsChangedEvent
		send: #pyramidFirstLevelElementsChanged:
		to: self.
	aProjectModel announcer
		when: PyramidSelectionChangedEvent
		send: #pyramidSelectionChanged:
		to: self
]

{ #category : #'as yet unclassified' }
PyramidProjectModelObserverForTest >> pyramidElementsChanged [

	self pyramidElementsChangedAction value.
]

{ #category : #accessing }
PyramidProjectModelObserverForTest >> pyramidElementsChanged: anEvent [

	self pyramidElementsChangedAction value: anEvent
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
PyramidProjectModelObserverForTest >> pyramidFirstLevelElementsChanged: anEvent [

	self pyramidFirstLevelElementsChangedAction value: anEvent
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
PyramidProjectModelObserverForTest >> pyramidSelectionChanged: anEvent [

	self pyramidSelectionChangedAction value: anEvent
]

{ #category : #accessing }
PyramidProjectModelObserverForTest >> pyramidSelectionChangedAction [

	^ pyramidSelectionChangedAction
]

{ #category : #accessing }
PyramidProjectModelObserverForTest >> pyramidSelectionChangedAction: anObject [

	pyramidSelectionChangedAction := anObject
]
