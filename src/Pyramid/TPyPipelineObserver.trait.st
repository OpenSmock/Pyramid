Trait {
	#name : #TPyPipelineObserver,
	#instVars : [
		'selection',
		'pipeline'
	],
	#category : #'Pyramid-Business'
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
TPyPipelineObserver >> pyPipelineUsedCommand [

	self shouldBeImplemented
]
