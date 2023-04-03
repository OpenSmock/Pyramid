Trait {
	#name : #TPyPipelineObserver,
	#instVars : [
		'pipeline'
	],
	#category : #'Pyramid-Business-Pipeline'
}

{ #category : #accessing }
TPyPipelineObserver >> pipeline [

	pipeline ifNil: [
		pipeline := PyPipeline new
			             addObserver: self;
			             yourself ].
	^ pipeline
]

{ #category : #accessing }
TPyPipelineObserver >> pipeline: aPyPipeline [

	self pipeline removeObserver: self.
	pipeline := aPyPipeline.
	pipeline addObserver: self
]

{ #category : #'as yet unclassified' }
TPyPipelineObserver >> pyPipelineCancelCommand [

	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
TPyPipelineObserver >> pyPipelineExecuteCommand [

	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
TPyPipelineObserver >> pyPipelineTerminateCommand [

	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
TPyPipelineObserver >> pyPipelineVerifyCommand [

	self shouldBeImplemented
]
