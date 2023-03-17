Class {
	#name : #PyViewProperties,
	#superclass : #PyViewAbstract,
	#traits : 'PyBlocInput',
	#classTraits : 'PyBlocInput classTrait',
	#instVars : [
		'properties'
	],
	#category : #'Pyramid-Deprecated'
}

{ #category : #layout }
PyViewProperties >> defaultLayout [

	| default |
	default := SpBoxLayout newTopToBottom spacing: 4.
	properties do: [ :prop | 
		default add: prop name expand: false.
		prop presenter addOn: default ].
	default add: self newNullPresenter expand: true.
	^ default
]

{ #category : #initialization }
PyViewProperties >> initializePresenters [

	properties := { 
		                    PyPropertyLocation new.
		                    PyPropertySize new.
		                    PyPropertyHeight new.
		                    PyPropertyWidth new.
		                    PyPropertyMargin new.
		                    PyPropertyPadding new }
]

{ #category : #accessing }
PyViewProperties >> pageIcon [

	^ self iconNamed: #edit
]

{ #category : #accessing }
PyViewProperties >> pageTitle [

	^ 'Properties'
]

{ #category : #'as yet unclassified' }
PyViewProperties >> receiveNewBlElement: aBlElement [

	aBlElement ifNil: [ ^ self ].
	properties do: [ :each | each element: aBlElement ]
]
