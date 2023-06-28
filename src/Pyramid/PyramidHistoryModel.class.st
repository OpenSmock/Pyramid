Class {
	#name : #PyramidHistoryModel,
	#superclass : #Object,
	#instVars : [
		'undoMemento',
		'redoMemento'
	],
	#category : #'Pyramid-plugin-history'
}

{ #category : #accessing }
PyramidHistoryModel >> redoMemento [

	^ redoMemento
]

{ #category : #accessing }
PyramidHistoryModel >> redoMemento: anObject [

	redoMemento := anObject
]

{ #category : #accessing }
PyramidHistoryModel >> undoMemento [

	^ undoMemento
]

{ #category : #accessing }
PyramidHistoryModel >> undoMemento: anObject [

	undoMemento := anObject
]
