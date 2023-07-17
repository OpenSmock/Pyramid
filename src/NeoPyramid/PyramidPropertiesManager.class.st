Class {
	#name : #PyramidPropertiesManager,
	#superclass : #Object,
	#instVars : [
		'properties',
		'commandExecutor',
		'presenterStrategy'
	],
	#category : #'NeoPyramid-property'
}

{ #category : #adding }
PyramidPropertiesManager >> addProperty: aPyramidProperty [

	aPyramidProperty commandExecutor: self commandExecutor.
	self properties add: aPyramidProperty
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManager >> buildPresenterFromCollection: aCollection [

	| clustersAndProps |
	clustersAndProps := self properties collect: [ :each |
		                    (each command clusterOf: aCollection asArray) -> each ].
	^ (self presenterStrategy buildPresenterFromClustersAndProperties:
		  clustersAndProps)
]

{ #category : #accessing }
PyramidPropertiesManager >> commandExecutor [

	^ commandExecutor
]

{ #category : #accessing }
PyramidPropertiesManager >> commandExecutor: anObject [

	commandExecutor := anObject.
	self properties do: [ :each | each commandExecutor: anObject ]
]

{ #category : #initialization }
PyramidPropertiesManager >> initialize [

	properties := OrderedCollection new.
	commandExecutor := NeoPyramidCommandExecutor new.
	presenterStrategy := PyramidHideEmptyPropertyStrategy new
]

{ #category : #accessing }
PyramidPropertiesManager >> presenterStrategy [

	^ presenterStrategy
]

{ #category : #accessing }
PyramidPropertiesManager >> presenterStrategy: anObject [

	presenterStrategy := anObject.
]

{ #category : #accessing }
PyramidPropertiesManager >> properties [

	^ properties
]
