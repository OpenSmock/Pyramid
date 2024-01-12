"
I transform a `PyramidCluster` and a `NeoPyramidProperty` into a `SpPresenter`.

"
Class {
	#name : #PyramidPropertyPresenterBuilder,
	#superclass : #Object,
	#instVars : [
		'cluster',
		'property',
		'isNilDefault'
	],
	#category : #'Pyramid-property'
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

{ #category : #initialization }
PyramidPropertyPresenterBuilder >> initialize [

isNilDefault := false.
]

{ #category : #initialization }
PyramidPropertyPresenterBuilder >> isNilDefault [

	^ isNilDefault
]

{ #category : #initialization }
PyramidPropertyPresenterBuilder >> makeNilDefault [

	isNilDefault := true
]

{ #category : #accessing }
PyramidPropertyPresenterBuilder >> property [

	^ property
]

{ #category : #accessing }
PyramidPropertyPresenterBuilder >> property: anObject [

	property := anObject
]
