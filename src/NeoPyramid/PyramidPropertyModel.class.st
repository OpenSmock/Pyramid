Class {
	#name : #PyramidPropertyModel,
	#superclass : #Object,
	#instVars : [
		'observers',
		'statesDictionary'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyModel >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #'as yet unclassified' }
PyramidPropertyModel >> informStatesDictionaryChanged [
	self observers do: [ :each | each statesDictonaryChanged].
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
PyramidPropertyModel >> statesDictionary [
	statesDictionary ifNil: [ ^ Dictionary new ].
	^ statesDictionary
]

{ #category : #accessing }
PyramidPropertyModel >> statesDictionary: aDictionary [

	statesDictionary := aDictionary.
	self informStatesDictionaryChanged
]
