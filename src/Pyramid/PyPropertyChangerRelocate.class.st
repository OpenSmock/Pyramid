Class {
	#name : #PyPropertyChangerRelocate,
	#superclass : #Object,
	#traits : 'TPyPropertyChanger',
	#classTraits : 'TPyPropertyChanger classTrait',
	#category : #'Pyramid-Editor-Properties-Changer'
}

{ #category : #'as yet unclassified' }
PyPropertyChangerRelocate >> commandClass [

	^ PyCommandRelocate
]

{ #category : #'as yet unclassified' }
PyPropertyChangerRelocate >> mutliFormClass [

	^ PyFormPoint
]

{ #category : #accessing }
PyPropertyChangerRelocate >> order [

	^ 2
]

{ #category : #'as yet unclassified' }
PyPropertyChangerRelocate >> sectionName [

	^ 'Location'
]

{ #category : #'as yet unclassified' }
PyPropertyChangerRelocate >> singleFormClass [

	^ PyFormPoint
]
