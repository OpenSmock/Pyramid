Class {
	#name : #PyramidPropertyModel,
	#superclass : #Object,
	#instVars : [
		'observers',
		'states'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyModel >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #accessing }
PyramidPropertyModel >> allElements [

	^ self states flatCollectAsSet: [ :each | each source ]
]

{ #category : #'as yet unclassified' }
PyramidPropertyModel >> informPropertyModelChanged [

	self observers do: [ :each | each propertyModelChanged ]
]

{ #category : #'as yet unclassified' }
PyramidPropertyModel >> observers [

	observers ifNil: [ observers := Set new ].
	^ observers.
]

{ #category : #removing }
PyramidPropertyModel >> removeObserver: anObserver [

	self observers remove: anObserver
]

{ #category : #accessing }
PyramidPropertyModel >> states [

	states ifNil: [ states := OrderedCollection new ].
	^ states
]

{ #category : #accessing }
PyramidPropertyModel >> states: aCollection [

	states := aCollection.
	self informPropertyModelChanged
]
