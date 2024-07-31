Class {
	#name : #PyramidProjectModelEvent,
	#superclass : #PyramidEvent,
	#instVars : [
		'selection',
		'firstLevelElements'
	],
	#category : 'Pyramid-core'
}

{ #category : #accessing }
PyramidProjectModelEvent >> firstLevelElements [

	^ firstLevelElements
]

{ #category : #accessing }
PyramidProjectModelEvent >> firstLevelElements: anObject [

	firstLevelElements := anObject
]

{ #category : #accessing }
PyramidProjectModelEvent >> selection [

	^ selection
]

{ #category : #accessing }
PyramidProjectModelEvent >> selection: anObject [

	selection := anObject
]
