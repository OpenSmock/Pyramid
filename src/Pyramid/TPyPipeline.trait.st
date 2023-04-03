Trait {
	#name : #TPyPipeline,
	#instVars : [
		'observers'
	],
	#category : #'Pyramid-Business-Pipeline'
}

{ #category : #adding }
TPyPipeline >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #notifying }
TPyPipeline >> notifyObserversPipelineCancelCommand [

	self observers do: [ :observer | observer pyPipelineCancelCommand ]
]

{ #category : #notifying }
TPyPipeline >> notifyObserversPipelineExecuteCommand [

	self observers do: [ :observer | observer pyPipelineExecuteCommand ]
]

{ #category : #notifying }
TPyPipeline >> notifyObserversPipelineTerminateCommand [

	self observers do: [ :observer | observer pyPipelineTerminateCommand ]
]

{ #category : #notifying }
TPyPipeline >> notifyObserversPipelineVerifyCommand [

	self observers do: [ :observer | observer pyPipelineVerifyCommand ]
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
