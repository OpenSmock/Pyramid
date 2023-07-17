Class {
	#name : #NeoPyramidProperty,
	#superclass : #Object,
	#instVars : [
		'command',
		'commandExecutor',
		'pyramidInputPresenterClass',
		'presenterBuilder',
		'name'
	],
	#category : #'NeoPyramid-property'
}

{ #category : #'as yet unclassified' }
NeoPyramidProperty >> buildPresenterFromCluster: aCluster [

	^ self presenterBuilder
		  cluster: aCluster;
		  property: self;
		  build
]

{ #category : #accessing }
NeoPyramidProperty >> command [

	^ command
]

{ #category : #accessing }
NeoPyramidProperty >> command: anObject [

	command := anObject
]

{ #category : #accessing }
NeoPyramidProperty >> commandExecutor [

	^ commandExecutor
]

{ #category : #accessing }
NeoPyramidProperty >> commandExecutor: anObject [

	commandExecutor := anObject
]

{ #category : #accessing }
NeoPyramidProperty >> name [

	^ name
]

{ #category : #accessing }
NeoPyramidProperty >> name: anObject [

	name := anObject
]

{ #category : #accessing }
NeoPyramidProperty >> presenterBuilder [

	^ presenterBuilder
]

{ #category : #accessing }
NeoPyramidProperty >> presenterBuilder: anObject [

	presenterBuilder := anObject
]

{ #category : #accessing }
NeoPyramidProperty >> pyramidInputPresenterClass [

	^ pyramidInputPresenterClass
]

{ #category : #accessing }
NeoPyramidProperty >> pyramidInputPresenterClass: anObject [

	pyramidInputPresenterClass := anObject
]
