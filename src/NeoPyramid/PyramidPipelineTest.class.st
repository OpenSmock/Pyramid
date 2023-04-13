Class {
	#name : #PyramidPipelineTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-plugin-commands'
}

{ #category : #tests }
PyramidPipelineTest >> testUseCommandOn [

	| target command counter sum pipeline |
	pipeline := PyramidPipeline new.
	target := { 1. 2. 3. 4 }.
	counter := 0.
	sum := 0.
	command := PyramidCommand
		           name: 'test'
		           set: [ :state :obj |
			           counter := counter + 1.
			           sum := sum + obj ]
		           get: [ :state :obj |  ]
		           targets: { SmallInteger }.
	pipeline
		useCommand: command
		on: (PyramidPipelineTarget new collection: target).

	self assert: counter equals: 4.
	self assert: sum equals: 10
]
