Trait {
	#name : #PyBlocInput,
	#category : #'Pyramid-Utilities'
}

{ #category : #transmission }
PyBlocInput >> defaultInputPort [

	^ self inputShapePort
]

{ #category : #transmission }
PyBlocInput >> inputShapePort [

	^ PyBlocPort newPresenter: self
]

{ #category : #testing }
PyBlocInput >> isPyBlocInput [

	^ true
]

{ #category : #'as yet unclassified' }
PyBlocInput >> receiveNewBlElement: aBlElement [

	self shouldBeImplemented
]
