"
I create a `SpPresenter` from a `PyramidPropertiesManager` that expose multiple properties of objects inside a collection.

I do that with the message `#buildPresenterFromCollection:andManager:`

"
Class {
	#name : #PyramidPresenterPropertiesStrategy,
	#superclass : #Object,
	#category : #'Pyramid-property'
}

{ #category : #testing }
PyramidPresenterPropertiesStrategy class >> isAbstract [

	^ self == PyramidPresenterPropertiesStrategy
]

{ #category : #'as yet unclassified' }
PyramidPresenterPropertiesStrategy >> buildPresenterFromCollection: aCollection andManager: aManager [

	^ self shouldBeImplemented
]

{ #category : #testing }
PyramidPresenterPropertiesStrategy >> hasAnyPropertyWith: aCollection
		  withManager: aManager [
		
	^ true
]
