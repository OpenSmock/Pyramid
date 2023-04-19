Trait {
	#name : #TPyramidPipeline,
	#instVars : [
		'observers'
	],
	#category : #'NeoPyramid-commands'
}

{ #category : #adding }
TPyramidPipeline >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #notifying }
TPyramidPipeline >> informPipelineCancelCommand [

	self observers do: [ :observer | observer pyramidPipelineCancelCommand ]
]

{ #category : #notifying }
TPyramidPipeline >> informPipelineExecuteCommand [

	self observers do: [ :observer | observer pyramidPipelineExecuteCommand ]
]

{ #category : #notifying }
TPyramidPipeline >> informPipelineTerminateCommand [

	self observers do: [ :observer | observer pyramidPipelineTerminateCommand ]
]

{ #category : #notifying }
TPyramidPipeline >> informPipelineVerifyCommand [

	self observers do: [ :observer | observer pyramidPipelineVerifyCommand ]
]

{ #category : #adding }
TPyramidPipeline >> observers [ 

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPyramidPipeline >> removeObserver: anObserver [

	self observers remove: anObserver ifAbsent: [  ]
]
