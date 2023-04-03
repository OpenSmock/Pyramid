Trait {
	#name : #TPySelection,
	#instVars : [
		'observers'
	],
	#category : #'Pyramid-Business'
}

{ #category : #adding }
TPySelection >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #testing }
TPySelection >> isVoid [

	^ false
]

{ #category : #notifying }
TPySelection >> notifyObservers [
	
	self observers do: [ :observer | observer pySelectionChanged ]
]

{ #category : #adding }
TPySelection >> observers [ 

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPySelection >> removeObserver: anObserver [

	self observers remove: anObserver ifAbsent: [  ]
]
