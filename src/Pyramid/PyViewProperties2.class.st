Class {
	#name : #PyViewProperties2,
	#superclass : #PyViewAbstract,
	#traits : 'PyBlocInput',
	#classTraits : 'PyBlocInput classTrait',
	#instVars : [
		'properties'
	],
	#category : #'Pyramid-Editor-Views'
}

{ #category : #layout }
PyViewProperties2 >> defaultLayout [

	| default |
	default := SpBoxLayout newTopToBottom spacing: 4.
	default add: 'Properties'.
	properties do: [ :prop | 
		default add: prop name expand: false.
		prop addOn: default ].
	default add: self newNullPresenter expand: true.
	^ SpScrollableLayout with: default
]

{ #category : #initialization }
PyViewProperties2 >> initializePresenters [

	properties := {}
]

{ #category : #accessing }
PyViewProperties2 >> pageIcon [

	^ self iconNamed: #edit
]

{ #category : #accessing }
PyViewProperties2 >> pageTitle [

	^ 'Properties'
]

{ #category : #'as yet unclassified' }
PyViewProperties2 >> receiveNewBlElement: aBlElement [

	self receiveNewCollection: aBlElement
]

{ #category : #'as yet unclassified' }
PyViewProperties2 >> receiveNewCollection: anArray [

	properties := (PyPropertyIdentifier propertiesFromCollection: anArray)
	, (PyPropertyColor propertiesFromCollection: anArray)
	              , (PyPropertyHeight propertiesFromCollection: anArray)
	              , (PyPropertyWidth propertiesFromCollection: anArray)
	              , (PyPropertySize propertiesFromCollection: anArray)
	              ,
	              (PyPropertyLocation propertiesFromCollection: anArray)
	              , (PyPropertyMargin propertiesFromCollection: anArray)
	              , (PyPropertyPadding propertiesFromCollection: anArray).

	self layout: self defaultLayout
]
