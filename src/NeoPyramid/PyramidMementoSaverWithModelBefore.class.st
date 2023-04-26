Class {
	#name : #PyramidMementoSaverWithModelBefore,
	#superclass : #PyramidMementoSaverAbstract,
	#instVars : [
		'collection',
		'history'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #accessing }
PyramidMementoSaverWithModelBefore >> collection [

	^ collection
]

{ #category : #accessing }
PyramidMementoSaverWithModelBefore >> collection: anObject [

	collection := anObject
]

{ #category : #accessing }
PyramidMementoSaverWithModelBefore >> history [

	^ history
]

{ #category : #accessing }
PyramidMementoSaverWithModelBefore >> history: anObject [

	history := anObject
]

{ #category : #adding }
PyramidMementoSaverWithModelBefore >> saveMemento: aMemento [

	self collection addFirst: (PyramidHistoryModel new
			 undoMemento: aMemento;
			 yourself).
	self history resetUndoCounter
]
