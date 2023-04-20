Class {
	#name : #PyramidPropertyInput,
	#superclass : #SpPresenter,
	#instVars : [
		'targets',
		'arguments',
		'property',
		'inputPresenter'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInput >> arguments [

	^ arguments
]

{ #category : #accessing }
PyramidPropertyInput >> arguments: anObject [

	arguments := anObject
]

{ #category : #accessing }
PyramidPropertyInput >> inputPresenter [
^ inputPresenter
]

{ #category : #accessing }
PyramidPropertyInput >> inputPresenter: aPresenter [

	inputPresenter := aPresenter
]

{ #category : #accessing }
PyramidPropertyInput >> property [

	^ property
]

{ #category : #accessing }
PyramidPropertyInput >> property: anObject [

	property := anObject
]

{ #category : #submit }
PyramidPropertyInput >> submit [

	self property submit: self arguments on: self targets
]

{ #category : #accessing }
PyramidPropertyInput >> targets [

	^ targets
]

{ #category : #accessing }
PyramidPropertyInput >> targets: anObject [

	targets := anObject
]
