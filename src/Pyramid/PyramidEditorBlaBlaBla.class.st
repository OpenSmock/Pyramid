Class {
	#name : #PyramidEditorBlaBlaBla,
	#superclass : #Object,
	#instVars : [
		'plugins',
		'projectModel',
		'window',
		'propertiesManager'
	],
	#category : #'Pyramid-core'
}

{ #category : #initialization }
PyramidEditorBlaBlaBla >> initialize [

	projectModel := PyramidProjectModel new.
	propertiesManager := PyramidPropertiesManagerForSelection new
		                     projectModel: projectModel;
		                     yourself.
	plugins := {  }
]

{ #category : #accessing }
PyramidEditorBlaBlaBla >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidEditorBlaBlaBla >> plugins: aCollection [

	plugins := aCollection
]

{ #category : #accessing }
PyramidEditorBlaBlaBla >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidEditorBlaBlaBla >> propertiesManager [

	^ propertiesManager
]

{ #category : #accessing }
PyramidEditorBlaBlaBla >> view [

	^ self window presenter
]

{ #category : #accessing }
PyramidEditorBlaBlaBla >> window [

	^ window
]

{ #category : #accessing }
PyramidEditorBlaBlaBla >> window: anObject [

	window := anObject.
	window at: #tabRight addItem: [ :builder |
		builder
			makeTab: self propertiesManager presenter
			label: 'Properties'
			icon: (self iconNamed: #box)
			order: 1 ]
]
