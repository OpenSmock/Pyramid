Trait {
	#name : #TPyramidOverlay,
	#instVars : [
		'observers'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #adding }
TPyramidOverlay >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #notifying }
TPyramidOverlay >> informVisibilityChanged [

	self observers do: [ :observer |
		observer pyramidVisibilityChanged ]
]

{ #category : #adding }
TPyramidOverlay >> observers [ 

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPyramidOverlay >> removeObserver: anObserver [

	self observers remove: anObserver ifAbsent: [  ]
]
