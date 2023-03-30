Trait {
	#name : #TPyPipeline,
	#instVars : [
		'observers'
	],
	#category : #'Pyramid-Business'
}

{ #category : #adding }
TPyPipeline >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #notifying }
TPyPipeline >> notifyObservers [

	self observers do: [ :observer | observer pyPipelineUsedCommand ]
]

{ #category : #adding }
TPyPipeline >> observers [ 

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPyPipeline >> removeObserver: anObserver [

	self observers remove: anObserver ifAbsent: [  ]
]
