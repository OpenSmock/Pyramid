Class {
	#name : #PyramidPropertyNotInstalledError,
	#superclass : #PyramidError,
	#instVars : [
		'manager',
		'property'
	],
	#category : #'Pyramid-property'
}

{ #category : #accessing }
PyramidPropertyNotInstalledError >> manager [

	^ manager
]

{ #category : #accessing }
PyramidPropertyNotInstalledError >> manager: anObject [

	manager := anObject
]

{ #category : #accessing }
PyramidPropertyNotInstalledError >> property [

	^ property
]

{ #category : #accessing }
PyramidPropertyNotInstalledError >> property: anObject [

	property := anObject
]
