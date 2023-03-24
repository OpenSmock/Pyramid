Class {
	#name : #PyPropertyChangerIdentifier,
	#superclass : #Object,
	#traits : 'TPyPropertyChanger',
	#classTraits : 'TPyPropertyChanger classTrait',
	#category : #'Pyramid-Editor-Panels-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyChangerIdentifier >> commandClass [

	^ PyCommandIdentifier
]

{ #category : #'as yet unclassified' }
PyPropertyChangerIdentifier >> mutliFormClass [

	^ PyFormText
]

{ #category : #accessing }
PyPropertyChangerIdentifier >> order [

	^ 1
]

{ #category : #'as yet unclassified' }
PyPropertyChangerIdentifier >> sectionName [

	^ 'Identifier'
]

{ #category : #'as yet unclassified' }
PyPropertyChangerIdentifier >> singleFormClass [

	^ PyFormText
]
