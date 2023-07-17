Class {
	#name : #NeoPyramidPropertiesManager,
	#superclass : #Object,
	#instVars : [
		'properties',
		'commandExecutor',
		'presenterBuilder',
		'presenterStrategy'
	],
	#category : #'NeoPyramid-property'
}

{ #category : #adding }
NeoPyramidPropertiesManager >> addProperty: aPyramidProperty [

	aPyramidProperty presenterBuilder: self presenterBuilder.
	aPyramidProperty commandExecutor: self commandExecutor.
	self properties add: aPyramidProperty
]

{ #category : #'as yet unclassified' }
NeoPyramidPropertiesManager >> buildPresenterFromCollection: aCollection [

	| clustersAndProps |
	clustersAndProps := self properties collect: [ :each |
		                    (each command clusterOf: aCollection) -> each ].
	^ (self presenterStrategy buildPresenterFromClustersAndProperties:
		  clustersAndProps)
]

{ #category : #accessing }
NeoPyramidPropertiesManager >> commandExecutor [

	^ commandExecutor
]

{ #category : #accessing }
NeoPyramidPropertiesManager >> commandExecutor: anObject [

	commandExecutor := anObject.
	self properties do: [ :each | each commandExecutor: anObject ]
]

{ #category : #initialization }
NeoPyramidPropertiesManager >> initialize [

	properties := OrderedCollection new.
	presenterBuilder := NeoPyramidPopingPresenterBuilder new.
	commandExecutor := NeoPyramidCommandExecutor new.
	presenterStrategy := NeoPyramidHideEmptyPropertyStrategy new
]

{ #category : #accessing }
NeoPyramidPropertiesManager >> presenterBuilder [

	^ presenterBuilder
]

{ #category : #accessing }
NeoPyramidPropertiesManager >> presenterBuilder: anObject [

	presenterBuilder := anObject.
	self properties do: [ :each | each presenterBuilder: anObject ]
]

{ #category : #accessing }
NeoPyramidPropertiesManager >> presenterStrategy [

	^ presenterStrategy
]

{ #category : #accessing }
NeoPyramidPropertiesManager >> presenterStrategy: anObject [

	presenterStrategy := anObject.
]

{ #category : #accessing }
NeoPyramidPropertiesManager >> properties [

	^ properties
]
