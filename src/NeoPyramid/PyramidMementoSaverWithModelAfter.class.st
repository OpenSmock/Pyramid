Class {
	#name : #PyramidMementoSaverWithModelAfter,
	#superclass : #PyramidMementoSaverAbstract,
	#instVars : [
		'collection'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #accessing }
PyramidMementoSaverWithModelAfter >> collection [

	^ collection
]

{ #category : #accessing }
PyramidMementoSaverWithModelAfter >> collection: anObject [

	collection := anObject
]

{ #category : #adding }
PyramidMementoSaverWithModelAfter >> saveMemento: aMemento [

	self collection first
			 redoMemento: aMemento
]
