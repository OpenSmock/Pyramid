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

	self history mementos ifNotEmpty: [ self history mementos removeFirst ].
	self history mementos addFirst: aMemento.
	self history resetUndoCounter
]
