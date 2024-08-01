Class {
	#name : #PyramidProperty,
	#superclass : #Object,
	#instVars : [
		'command',
		'commandExecutor',
		'inputPresenterClass',
		'presenterBuilder',
		'name',
		'inputPresenterModel'
	],
	#category : #'Pyramid-property'
}

{ #category : #'as yet unclassified' }
PyramidProperty >> buildPresenterFromCluster: aCluster [

	^ self presenterBuilder
		  cluster: aCluster;
		  property: self;
		  build
]

{ #category : #accessing }
PyramidProperty >> command [

	^ command
]

{ #category : #accessing }
PyramidProperty >> command: anObject [

	command := anObject
]

{ #category : #accessing }
PyramidProperty >> commandExecutor [

	^ commandExecutor
]

{ #category : #accessing }
PyramidProperty >> commandExecutor: anObject [

	commandExecutor := anObject
]

{ #category : #initialization }
PyramidProperty >> initialize [

	name := 'Default property name'
]

{ #category : #accessing }
PyramidProperty >> inputPresenterClass [

	^ inputPresenterClass
]

{ #category : #accessing }
PyramidProperty >> inputPresenterClass: anObject [

	inputPresenterClass := anObject.
	inputPresenterModel := anObject inputModelClass new
]

{ #category : #accessing }
PyramidProperty >> inputPresenterModel [

	^ inputPresenterModel
]

{ #category : #accessing }
PyramidProperty >> name [

	^ name
]

{ #category : #accessing }
PyramidProperty >> name: anObject [

	name := anObject
]

{ #category : #accessing }
PyramidProperty >> presenterBuilder [

	^ presenterBuilder
]

{ #category : #accessing }
PyramidProperty >> presenterBuilder: anObject [

	presenterBuilder := anObject
]
