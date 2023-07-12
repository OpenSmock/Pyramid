Class {
	#name : #PyramidEditor,
	#superclass : #Object,
	#instVars : [
		'plugins',
		'projectModel',
		'commandPipeline',
		'window',
		'properties'
	],
	#category : #'Pyramid-core'
}

{ #category : #accessing }
PyramidEditor >> commandPipeline [

	^ commandPipeline
]

{ #category : #initialization }
PyramidEditor >> initialize [

	projectModel := PyramidProjectModel new.
	commandPipeline := PyramidPipeline new.
	properties := PyramidPropertiesView new
		              pipeline: commandPipeline;
		              projectModel: projectModel;
		              yourself.
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
PyramidEditor >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidEditor >> properties [

	^ properties
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

	window := anObject.
	window at: #tabRight addItem: [ :builder |
		builder
			makeTab: self properties
			label: 'Properties'
			icon: (self iconNamed: #edit)
			order: 1 ]
]
