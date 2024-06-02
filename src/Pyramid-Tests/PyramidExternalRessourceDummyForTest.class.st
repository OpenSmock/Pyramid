Class {
	#name : 'PyramidExternalRessourceDummyForTest',
	#superclass : 'Object',
	#instVars : [
		'dummyValue'
	],
	#category : 'Pyramid-Tests-cases-external-ressources',
	#package : 'Pyramid-Tests',
	#tag : 'cases-external-ressources'
}

{ #category : 'tests - other' }
PyramidExternalRessourceDummyForTest class >> startAt3 [

	^ self new dummyValuePlus dummyValuePlus dummyValuePlus

]

{ #category : 'accessing' }
PyramidExternalRessourceDummyForTest >> dummyValue [

	^ dummyValue
]

{ #category : 'increment' }
PyramidExternalRessourceDummyForTest >> dummyValuePlus [

	dummyValue := dummyValue + 1
]

{ #category : 'initialization' }
PyramidExternalRessourceDummyForTest >> initialize [

	dummyValue := 0
]
