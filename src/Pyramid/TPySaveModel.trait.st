Trait {
	#name : #TPySaveModel,
	#instVars : [
		'observers'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #adding }
TPySaveModel >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #notifying }
TPySaveModel >> notifyObservers [

	self observers do: [ :observer | observer pySaveModelChanged ]
]

{ #category : #adding }
TPySaveModel >> observers [ 

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPySaveModel >> removeObserver: anObserver [

	self observers remove: anObserver ifAbsent: [  ]
]
