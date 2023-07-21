Class {
	#name : #PyramidEditor,
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
PyramidEditor >> initialize [

	projectModel := PyramidProjectModel new.
	propertiesManager := PyramidPropertiesManagerForSelection new
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
PyramidEditor >> propertiesManager [

	^ propertiesManager
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
			makeTab: self propertiesManager presenter
			label: 'Properties'
			icon: (self iconNamed: #box)
			order: 1 ]
]
