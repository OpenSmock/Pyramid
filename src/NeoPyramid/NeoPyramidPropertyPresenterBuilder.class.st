Class {
	#name : #NeoPyramidPropertyPresenterBuilder,
	#superclass : #Object,
	#instVars : [
		'cluster',
		'property'
	],
	#category : #'NeoPyramid-property'
}

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
