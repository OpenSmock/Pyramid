Class {
	#name : #PyCommandExecutor,
	#superclass : #Object,
	#traits : 'TPyPipelineWorker',
	#classTraits : 'TPyPipelineWorker classTrait',
	#category : #'Pyramid-Business-Pipeline'
}

{ #category : #'menu messages' }
PyCommandExecutor >> useCommand: aCommand onSelection: aSelection [

	| allStates |
	allStates := (aSelection elements collect: [ :each |
		             | args |
		             args := PyCommandArguments new.
		             aCommand stateOf: each for: args.
		             args ]) asSet.
	allStates ifEmpty: [ ^ self ].
	allStates size == 1 ifTrue: [ allStates asArray first value = aCommand arguments value ifTrue: [  ^ self ] ].
	aSelection useCommand: aCommand
]
