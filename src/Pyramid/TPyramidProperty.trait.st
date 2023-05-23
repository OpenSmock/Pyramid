Trait {
	#name : #TPyramidProperty,
	#instVars : [
		'observers'
	],
	#category : #'Pyramid-plugin-properties'
}

{ #category : #adding }
TPyramidProperty >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #notifying }
TPyramidProperty >> informInputsUpdated [

	self observers do: [ :observer | observer pyramidInputsUpdated ]
]

{ #category : #adding }
TPyramidProperty >> observers [ 

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPyramidProperty >> removeObserver: anObserver [

	self observers remove: anObserver ifAbsent: [  ]
]
