Class {
	#name : #PyramidValueCommand,
	#superclass : #PyramidAutomaticCommand,
	#instVars : [
		'reader',
		'writer'
	],
	#category : #'Pyramid-commands'
}

{ #category : #'as yet unclassified' }
PyramidValueCommand >> getValueFor: anObject [

	^ self reader value: anObject
]

{ #category : #accessing }
PyramidValueCommand >> reader [

	^ reader
]

{ #category : #accessing }
PyramidValueCommand >> reader: anObject [

	reader := anObject
]

{ #category : #'as yet unclassified' }
PyramidValueCommand >> setValueFor: anObject with: anArgument [

	self writer value: anObject value: anArgument
]

{ #category : #accessing }
PyramidValueCommand >> writer [

	^ writer
]

{ #category : #accessing }
PyramidValueCommand >> writer: anObject [

	writer := anObject
]
