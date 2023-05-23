Class {
	#name : #PyramidEditor,
	#superclass : #Object,
	#instVars : [
		'plugins',
		'activeProject',
		'commandPipeline',
		'window'
	],
	#category : #'Pyramid-core'
}

{ #category : #accessing }
PyramidEditor >> activeProject [

	^ activeProject
]

{ #category : #accessing }
PyramidEditor >> commandPipeline [

	^ commandPipeline
]

{ #category : #'as yet unclassified' }
PyramidEditor >> initialize [

	activeProject := PyramidActiveProjectModel new.
	commandPipeline := PyramidPipeline new.
	plugins := {  }
]

{ #category : #accessing }
PyramidEditor >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidEditor >> plugins: aCollection [

	plugins := aCollection
]

{ #category : #accessing }
PyramidEditor >> view [

	^ self window presenter
]

{ #category : #accessing }
PyramidEditor >> window [

	^ window
]

{ #category : #accessing }
PyramidEditor >> window: anObject [

	window := anObject
]
