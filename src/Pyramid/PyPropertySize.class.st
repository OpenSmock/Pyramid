Class {
	#name : #PyPropertySize,
	#superclass : #PyPropertyAbstract,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertySize class >> property: aProperty toElement: aBlElement [

	aBlElement size: aProperty
]

{ #category : #'as yet unclassified' }
PyPropertySize class >> propertyFromElement: aBlElement [

	| horizontal vertical |
	horizontal := aBlElement constraints horizontal resizer size.
	vertical := aBlElement constraints vertical resizer size.
	^ horizontal @ vertical

]

{ #category : #initialization }
PyPropertySize >> initializeForm [

	presenter := PyFormSpecPoint x: 'h' y: 'w'.
	presenter whenPointChangeDo: [ :point | 
		self property: point.
		self apply ]
]

{ #category : #accessing }
PyPropertySize >> name [

	^ 'Size'
]
