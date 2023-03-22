Class {
	#name : #PyPropertyIdentifier,
	#superclass : #PyPropertyAbstract,
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyIdentifier class >> property: aProperty toElement: aBlElement [

	aBlElement id: aProperty
]

{ #category : #'as yet unclassified' }
PyPropertyIdentifier class >> propertyFromElement: aBlElement [

	^ aBlElement id
]

{ #category : #initialization }
PyPropertyIdentifier >> initializeForm [

	presenter := PyFormSpecText label: 'id'.
	presenter whenTextChangedDo: [ :string |
		string ifEmpty: [ self property: (BlElementId noId) ] ifNotEmpty: [ self property: (BlElementId named: string) ]
		.
		self apply ]
]

{ #category : #accessing }
PyPropertyIdentifier >> name [

	^ 'Identifier'
]

{ #category : #accessing }
PyPropertyIdentifier >> property [

	^ property ifNil: [ ^ BlElementId noId ]
]

{ #category : #initialization }
PyPropertyIdentifier >> updateForm [

	self property isNoId
		ifTrue: [ self presenterForm value: '' ]
		ifFalse: [ self presenterForm value: self property identifier ]
]
