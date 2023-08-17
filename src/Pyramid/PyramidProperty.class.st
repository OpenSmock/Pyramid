Class {
	#name : #PyramidProperty,
	#superclass : #Object,
	#instVars : [
		'command',
		'commandExecutor',
		'pyramidInputPresenterClass',
		'presenterBuilder',
		'name',
		'pyramidInputPresenterStrings'
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

	presenterBuilder := PyramidPopingPresenterBuilder new.
	name := 'Default property name'
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

{ #category : #accessing }
PyramidProperty >> pyramidInputPresenterClass [

	^ pyramidInputPresenterClass
]

{ #category : #accessing }
PyramidProperty >> pyramidInputPresenterClass: anObject [

	pyramidInputPresenterClass := anObject.
	self pyramidInputPresenterStrings: anObject stringsClass new
]

{ #category : #accessing }
PyramidProperty >> pyramidInputPresenterStrings [

	^ pyramidInputPresenterStrings
]

{ #category : #accessing }
PyramidProperty >> pyramidInputPresenterStrings: anObject [

	pyramidInputPresenterStrings := anObject
]
