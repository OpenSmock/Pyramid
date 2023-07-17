Class {
	#name : #PyramidFakePropertyForTestStrategy,
	#superclass : #PyramidPresenterPropertiesStrategy,
	#instVars : [
		'properties'
	],
	#category : #'NeoPyramid-cases-property'
}

{ #category : #'as yet unclassified' }
PyramidFakePropertyForTestStrategy >> buildPresenterFromClustersAndProperties: aCollection [

	self properties: (aCollection collect: [ :each | each value ])
]

{ #category : #initialization }
PyramidFakePropertyForTestStrategy >> initialize [

	properties := OrderedCollection new.
]

{ #category : #accessing }
PyramidFakePropertyForTestStrategy >> properties [
^ properties
]

{ #category : #accessing }
PyramidFakePropertyForTestStrategy >> properties: anObject [

	properties := anObject
]

{ #category : #accessing }
PyramidFakePropertyForTestStrategy >> size [

	^ self properties size
]
