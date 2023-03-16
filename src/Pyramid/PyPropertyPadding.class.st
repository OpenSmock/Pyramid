Class {
	#name : #PyPropertyPadding,
	#superclass : #PyPropertyInsets,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyPadding class >> property: aProperty toElement: aBlElement [

	aBlElement padding: aProperty
]

{ #category : #'as yet unclassified' }
PyPropertyPadding class >> propertyFromElement: aBlElement [

	^ aBlElement padding
]

{ #category : #accessing }
PyPropertyPadding >> name [

	^ 'Padding'
]
