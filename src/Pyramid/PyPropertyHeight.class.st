Class {
	#name : #PyPropertyHeight,
	#superclass : #PyPropertyMinMax,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyHeight class >> property: aProperty toElement: aBlElement [

	aBlElement constraintsDo: [ :c | 
		c minHeight: aProperty x.
		c maxHeight: aProperty y ]
]

{ #category : #'as yet unclassified' }
PyPropertyHeight class >> propertyFromElement: aBlElement [

	| min max |
	min := aBlElement constraints minHeight.
	max := aBlElement constraints maxHeight.
	^ min @ max
]

{ #category : #accessing }
PyPropertyHeight >> name [

	^ 'Height'
]
