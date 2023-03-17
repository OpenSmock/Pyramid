Class {
	#name : #PyPropertyMargin,
	#superclass : #PyPropertyInsets,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyMargin class >> property: aProperty toElement: aBlElement [

	aBlElement margin: aProperty
]

{ #category : #'as yet unclassified' }
PyPropertyMargin class >> propertyFromElement: aBlElement [

	^ aBlElement margin
]

{ #category : #accessing }
PyPropertyMargin >> name [

	^ 'Margin'
]
