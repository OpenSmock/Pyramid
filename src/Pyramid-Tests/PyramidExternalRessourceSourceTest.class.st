Class {
	#name : #PyramidExternalRessourceSourceTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-Cases'
}

{ #category : #tests }
PyramidExternalRessourceSourceTest >> testGetRessource [

	| externalRessource object |
	externalRessource := PyramidExternalRessourceSource
		                     target: PyramidExternalRessourceDummyForTest
		                     selector: #startAt3.
	object := externalRessource getRessource.
	self assert: object dummyValue equals: 3.
]

{ #category : #tests }
PyramidExternalRessourceSourceTest >> testSerialize [

	| array arrayColors |
	array := { #red. #green. #blue. #red } collect: [ :each |
		         PyramidExternalRessourceSource target: Color selector: each ].
	arrayColors := array collect: [ :each | each getRessource ].
	self assert: (arrayColors at: 1) equals: Color red.
	self assert: (arrayColors at: 2) equals: Color green.
	self assert: (arrayColors at: 3) equals: Color blue.
	self assert: (arrayColors at: 4) equals: Color red.
	
	array := (STON fromString: (STON toString: array)).
	arrayColors := array collect: [ :each | each getRessource ].
	self assert: (arrayColors at: 1) equals: Color red.
	self assert: (arrayColors at: 2) equals: Color green.
	self assert: (arrayColors at: 3) equals: Color blue.
	self assert: (arrayColors at: 4) equals: Color red.
	
]
