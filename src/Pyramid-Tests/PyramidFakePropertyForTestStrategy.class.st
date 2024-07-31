Class {
	#name : #PyramidFakePropertyForTestStrategy,
	#superclass : #PyramidPresenterPropertiesStrategy,
	#instVars : [
		'properties'
	],
	#category : #'Pyramid-Tests-cases-property'
}

{ #category : #'as yet unclassified' }
PyramidFakePropertyForTestStrategy >> buildPresenterFromCollection: aCollection andManager: aManager [

	self properties: aManager properties
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
