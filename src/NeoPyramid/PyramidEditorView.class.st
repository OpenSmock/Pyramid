Class {
	#name : #PyramidEditorView,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'layoutStrategy'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #layout }
PyramidEditorView >> defaultLayout [

	^ self layoutStrategy layoutOf: self model
]

{ #category : #accessing }
PyramidEditorView >> layoutStrategy [

	^ layoutStrategy
]

{ #category : #accessing }
PyramidEditorView >> layoutStrategy: anObject [

	layoutStrategy := anObject.
	self updateLayout
]

{ #category : #accessing }
PyramidEditorView >> model [

	^ model
]

{ #category : #accessing }
PyramidEditorView >> model: anObject [

	model := anObject
]

{ #category : #private }
PyramidEditorView >> updateLayout [
	self layout: self defaultLayout
]
