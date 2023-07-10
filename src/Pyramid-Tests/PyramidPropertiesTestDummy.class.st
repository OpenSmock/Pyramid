Class {
	#name : #PyramidPropertiesTestDummy,
	#superclass : #BlElement,
	#instVars : [
		'isToto',
		'string'
	],
	#category : #'Pyramid-Tests-cases-properties'
}

{ #category : #accessing }
PyramidPropertiesTestDummy >> beToto [

	isToto := true
]

{ #category : #accessing }
PyramidPropertiesTestDummy >> initialize [

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
