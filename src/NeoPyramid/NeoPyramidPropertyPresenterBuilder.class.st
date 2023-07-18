Class {
	#name : #NeoPyramidPropertyPresenterBuilder,
	#superclass : #Object,
	#instVars : [
		'cluster',
		'property'
	],
	#category : #'NeoPyramid-property'
}

{ #category : #testing }
NeoPyramidPropertyPresenterBuilder class >> isAbstract [

	^ self == NeoPyramidPropertyPresenterBuilder
]

{ #category : #building }
NeoPyramidPropertyPresenterBuilder >> build [

	^ self shouldBeImplemented
]

{ #category : #accessing }
NeoPyramidPropertyPresenterBuilder >> cluster [

	^ cluster
]

{ #category : #accessing }
NeoPyramidPropertyPresenterBuilder >> cluster: anObject [

	cluster := anObject
]

{ #category : #accessing }
NeoPyramidPropertyPresenterBuilder >> property [

	^ property
]

{ #category : #accessing }
NeoPyramidPropertyPresenterBuilder >> property: anObject [

	property := anObject
]
