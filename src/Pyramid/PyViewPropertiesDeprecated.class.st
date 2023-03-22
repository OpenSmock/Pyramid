Class {
	#name : #PyViewPropertiesDeprecated,
	#superclass : #PyViewAbstract,
	#traits : 'PyBlocInput',
	#classTraits : 'PyBlocInput classTrait',
	#instVars : [
		'properties'
	],
	#category : #'Pyramid-ZZZ-Deprecated'
}

{ #category : #layout }
PyViewPropertiesDeprecated >> defaultLayout [

	| default |
	default := SpBoxLayout newTopToBottom spacing: 4.
	properties do: [ :prop | 
		default add: prop name expand: false.
		prop presenter addOn: default ].
	default add: self newNullPresenter expand: true.
	^ default
]

{ #category : #initialization }
PyViewPropertiesDeprecated >> initializePresenters [

	properties := { 
		                    PyPropertyLocation new.
		                    PyPropertySize new.
		                    PyPropertyHeight new.
		                    PyPropertyWidth new.
		                    PyPropertyMargin new.
		                    PyPropertyPadding new }
]

{ #category : #accessing }
PyViewPropertiesDeprecated >> pageIcon [

	^ self iconNamed: #edit
]

{ #category : #accessing }
PyViewPropertiesDeprecated >> pageTitle [

	^ 'Properties'
]

{ #category : #'as yet unclassified' }
PyViewPropertiesDeprecated >> receiveNewBlElement: aBlElement [

	aBlElement ifNil: [ ^ self ].
	properties do: [ :each | each element: aBlElement ]
]
