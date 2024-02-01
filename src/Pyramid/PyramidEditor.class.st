Class {
	#name : #PyramidEditor,
	#superclass : #Object,
	#traits : 'TPyramidFindPlugin',
	#classTraits : 'TPyramidFindPlugin classTrait',
	#instVars : [
		'plugins',
		'projectModel',
		'window',
		'propertiesManager'
	],
	#category : #'Pyramid-core'
}

{ #category : #private }
PyramidEditor class >> buildEditor [

	^ PyramidPluginManager uniqueInstance buildEditor
]

{ #category : #'instance creation' }
PyramidEditor class >> open [
	<script>

	self buildEditor open
]

{ #category : #'open/close' }
PyramidEditor >> close [

	self window ifNil: [ ^ self ].
	self window isClosed ifTrue:[ ^ self ].
	self window close
]

{ #category : #plugins }
PyramidEditor >> getPlugin: aPluginClass [

	^ self plugins detect:[ :p | p class = aPluginClass ] ifNone:[ ]
]

{ #category : #initialization }
PyramidEditor >> initialize [

	projectModel := PyramidProjectModel new.
	propertiesManager := PyramidPropertiesManagerForSelection new
		                     projectModel: projectModel;
		                     yourself.
	plugins := {  }
]

{ #category : #'open/close' }
PyramidEditor >> open [

	self window ifNil: [ ^ self ].
	self window isOpen ifTrue:[ ^ self ].
	self window open
]

{ #category : #plugins }
PyramidEditor >> plugins [

	^ plugins
]

{ #category : #plugins }
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
