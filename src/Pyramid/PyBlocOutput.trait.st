Trait {
	#name : #PyBlocOutput,
	#category : #'Pyramid-Utilities'
}

{ #category : #ports }
PyBlocOutput >> defaultOutputPort [

	^ self outputSelectionPort
]

{ #category : #testing }
PyBlocOutput >> isPyBlocOutput [

	^ true
]

{ #category : #transmission }
PyBlocOutput >> outputSelectionPort [

	^ self shouldBeImplemented
]
