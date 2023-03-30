Trait {
	#name : #TPyHistory,
	#instVars : [
		'observers'
	],
	#category : #'Pyramid-Plugin-History'
}

{ #category : #adding }
TPyHistory >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #notifying }
TPyHistory >> notifyObservers [

	self observers do: [ :observer | observer pyHistoryUpdated ]
]

{ #category : #adding }
TPyHistory >> observers [ 

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPyHistory >> removeObserver: anObserver [

	self observers remove: anObserver ifAbsent: [  ]
]
