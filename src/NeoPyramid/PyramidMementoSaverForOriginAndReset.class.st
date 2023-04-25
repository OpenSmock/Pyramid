Class {
	#name : #PyramidMementoSaverForOriginAndReset,
	#superclass : #PyramidMementoSaverAbstract,
	#instVars : [
		'history'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #accessing }
PyramidMementoSaverForOriginAndReset >> history [

	^ history
]

{ #category : #accessing }
PyramidMementoSaverForOriginAndReset >> history: anObject [

	history := anObject
]

{ #category : #adding }
PyramidMementoSaverForOriginAndReset >> saveMemento: aMemento [

	self history originMemento ifNil: [
		self history originMemento: aMemento ].
	self history resetUndoCounter
]
