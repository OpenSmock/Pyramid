Class {
	#name : #PyramidPropertiesTestDummy,
	#superclass : #BlElement,
	#instVars : [
		'isToto',
		'string'
	],
	#category : #'Pyramid-Tests-cases-properties'
}

{ #category : #'change - properties' }
PyramidPropertiesTestDummy >> beToto [

	isToto := true
]

{ #category : #initialization }
PyramidPropertiesTestDummy >> initialize [

	super initialize.
	isToto := false
]

{ #category : #accessing }
PyramidPropertiesTestDummy >> isToto [
^ isToto
]

{ #category : #accessing }
PyramidPropertiesTestDummy >> string [
	^ string
]

{ #category : #accessing }
PyramidPropertiesTestDummy >> string: aString [

	string := aString
]
