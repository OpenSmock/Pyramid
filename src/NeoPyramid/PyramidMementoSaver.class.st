Class {
	#name : #PyramidMementoSaver,
	#superclass : #PyramidMementoSaverAbstract,
	#instVars : [
		'collection'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #accessing }
PyramidMementoSaver >> collection [

	^ collection
]

{ #category : #accessing }
PyramidMementoSaver >> collection: anObject [

	collection := anObject
]

{ #category : #adding }
PyramidMementoSaver >> saveMemento: aMemento [

	self collection addFirst: aMemento
]
