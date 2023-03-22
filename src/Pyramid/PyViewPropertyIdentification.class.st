Class {
	#name : #PyViewPropertyIdentification,
	#superclass : #SpPresenter,
	#traits : 'TPyViewProperty',
	#classTraits : 'TPyViewProperty classTrait',
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyViewPropertyIdentification >> commandWith: aString [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
PyViewPropertyIdentification >> createSingleLineForm [

	^ PyFormText new
]

{ #category : #'as yet unclassified' }
PyViewPropertyIdentification >> differentsValue [

	^ '# mixed value'
]

{ #category : #'as yet unclassified' }
PyViewPropertyIdentification >> emptyValue [
	^ ''
]

{ #category : #accessing }
PyViewPropertyIdentification >> name [

	^ 'Identification'
]

{ #category : #accessing }
PyViewPropertyIdentification >> order [

	^ 1
]

{ #category : #'as yet unclassified' }
PyViewPropertyIdentification >> valueFromElement: aBlElement [

	| id |
	id := aBlElement id.

	id isNoId
		ifTrue: [ ^ '' ]
		ifFalse: [ ^ id asSymbol ]
]
