Class {
	#name : #PyramidEditor,
	#superclass : #Object,
	#instVars : [
		'plugins',
		'view'
	],
	#category : #'NeoPyramid-core'
}

{ #category : #accessing }
PyramidEditor >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidEditor >> plugins: aCollection [

	plugins := aCollection
]

{ #category : #accessing }
PyramidEditor >> view [
 ^ view
]

{ #category : #accessing }
PyramidEditor >> view: aSpPresenter [

	view:= aSpPresenter
]
