"
I transform a `PyramidCluster` and a `NeoPyramidProperty` into a `SpPresenter`.

"
Class {
	#name : #PyramidPropertyPresenterBuilder,
	#superclass : #Object,
	#instVars : [
		'cluster',
		'property'
	],
	#category : 'Pyramid-property'
}

{ #category : #testing }
PyramidPropertyPresenterBuilder class >> isAbstract [

	^ self == PyramidPropertyPresenterBuilder
]

{ #category : #building }
PyramidPropertyPresenterBuilder >> build [

	^ self shouldBeImplemented
]

{ #category : #accessing }
PyramidPropertyPresenterBuilder >> cluster [

	^ cluster
]

{ #category : #accessing }
PyramidPropertyPresenterBuilder >> cluster: anObject [

	cluster := anObject
]

{ #category : #accessing }
PyramidPropertyPresenterBuilder >> property [

	^ property
]

{ #category : #accessing }
PyramidPropertyPresenterBuilder >> property: anObject [

	property := anObject
]
