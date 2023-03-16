Class {
	#name : #PyPropertyWidth,
	#superclass : #PyPropertyMinMax,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyWidth class >> property: aProperty toElement: aBlElement [

	aBlElement constraintsDo: [ :c | 
		c minWidth: aProperty x.
		c maxWidth: aProperty y ]
]

{ #category : #'as yet unclassified' }
PyPropertyWidth class >> propertyFromElement: aBlElement [

	| min max |
	min := aBlElement constraints minWidth.
	max := aBlElement constraints maxWidth.
	^ min @ max
]

{ #category : #accessing }
PyPropertyWidth >> name [

	^ 'Width'
]
