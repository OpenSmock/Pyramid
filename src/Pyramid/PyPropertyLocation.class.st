Class {
	#name : #PyPropertyLocation,
	#superclass : #PyPropertyAbstract,
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyLocation class >> property: aProperty toElement: aBlElement [

	aBlElement relocate: aProperty
]

{ #category : #'as yet unclassified' }
PyPropertyLocation class >> propertyFromElement: aBlElement [

	^ aBlElement constraints position
]

{ #category : #initialization }
PyPropertyLocation >> initializeForm [

	presenter := PyFormSpecPoint x: 'x' y: 'y'.
	presenter whenPointChangeDo: [ :point | 
		self property: point.
		self apply ]
]

{ #category : #accessing }
PyPropertyLocation >> name [

	^ 'Position'
]
