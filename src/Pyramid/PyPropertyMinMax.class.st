Class {
	#name : #PyPropertyMinMax,
	#superclass : #PyPropertyAbstract,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #testing }
PyPropertyMinMax class >> isAbstract [

	^ self == PyPropertyMinMax
]

{ #category : #initialization }
PyPropertyMinMax >> initializeForm [

	presenter := PyFormSpecPointWithInfinityValues x: 'min' y: 'max'.
	presenter whenPointChangeDo: [ :point | 
		self property: point.
		self apply ]
]
