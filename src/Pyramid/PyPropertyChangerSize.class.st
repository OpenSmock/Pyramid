Class {
	#name : #PyPropertyChangerSize,
	#superclass : #Object,
	#traits : 'TPyPropertyChanger',
	#classTraits : 'TPyPropertyChanger classTrait',
	#category : #'Pyramid-Editor-Properties-Changer'
}

{ #category : #'as yet unclassified' }
PyPropertyChangerSize >> commandClass [

	^ PyCommandSize
]

{ #category : #'as yet unclassified' }
PyPropertyChangerSize >> mutliFormClass [

	^ PyFormPoint
]

{ #category : #accessing }
PyPropertyChangerSize >> order [

	^ 3
]

{ #category : #'as yet unclassified' }
PyPropertyChangerSize >> sectionName [

	^ 'Size'
]

{ #category : #'as yet unclassified' }
PyPropertyChangerSize >> singleFormClass [

	^ PyFormPoint
]
