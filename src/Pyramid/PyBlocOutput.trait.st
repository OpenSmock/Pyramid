Trait {
	#name : #PyBlocOutput,
	#category : #'Pyramid-ZZZ-Deprecated-Utilities'
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
