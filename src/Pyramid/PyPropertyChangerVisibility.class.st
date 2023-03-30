Class {
	#name : #PyPropertyChangerVisibility,
	#superclass : #Object,
	#traits : 'TPyPropertyChanger',
	#classTraits : 'TPyPropertyChanger classTrait',
	#category : #'Pyramid-Editor-Properties-Changer'
}

{ #category : #'as yet unclassified' }
PyPropertyChangerVisibility >> commandClass [

	^ PyCommandVisibility
]

{ #category : #'as yet unclassified' }
PyPropertyChangerVisibility >> mutliFormClass [

	^ PyFormVisibility
]

{ #category : #accessing }
PyPropertyChangerVisibility >> order [

	^ 5
]

{ #category : #'as yet unclassified' }
PyPropertyChangerVisibility >> sectionName [

	^ 'Visibility'
]

{ #category : #'as yet unclassified' }
PyPropertyChangerVisibility >> singleFormClass [

	^ PyFormVisibility
]
