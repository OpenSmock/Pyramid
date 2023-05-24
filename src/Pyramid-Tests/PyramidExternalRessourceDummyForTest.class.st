Class {
	#name : #PyramidExternalRessourceDummyForTest,
	#superclass : #Object,
	#instVars : [
		'dummyValue'
	],
	#category : #'Pyramid-Tests-Utils'
}

{ #category : #'as yet unclassified' }
PyramidExternalRessourceDummyForTest class >> startAt3 [

	^ self new dummyValuePlus dummyValuePlus dummyValuePlus

]

{ #category : #accessing }
PyramidExternalRessourceDummyForTest >> dummyValue [

	^ dummyValue
]

{ #category : #accessing }
PyramidExternalRessourceDummyForTest >> dummyValuePlus [

	dummyValue := dummyValue + 1
]

{ #category : #accessing }
PyramidExternalRessourceDummyForTest >> initialize [

	dummyValue := 0
]
