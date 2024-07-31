Class {
	#name : #PyramidExternalRessourceSourceTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-external-ressources'
}

{ #category : #tests }
PyramidExternalRessourceSourceTest >> testFormFromFileNamed [

	| form hash path ressource newRessource |
	form := Morph new asForm.
	hash := 'temp_for_testing_' , form hash printString.
	path := Path workingDirectory / (hash , '.png').
	self assert: path asFileReference exists not.
	form writePNGFileNamed: path.
	self assert: path asFileReference exists.


	[ressource := PyramidExternalRessourceSource formFromFileNamed: path.
	self assert: ressource getRessource class equals: Form.
	self assert: ressource getRessource bits equals: form bits.

	newRessource := STON fromString: (STON toString: ressource).
	self assert: newRessource getRessource class equals: Form.
	self assert: newRessource getRessource bits equals: form bits.]
	ensure: [
			path asFileReference delete.
			self assert: path asFileReference exists not ]
]

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

{ #category : #tests }
PyramidExternalRessourceSourceTest >> testTargetSelector [

	| color newColor |
	color := PyramidExternalRessourceSource target: Color selector: #red.
	self assert: color getRessource equals: Color red.

	newColor := STON fromString: (STON toString: color).
	self assert: newColor getRessource equals: Color red
]

{ #category : #tests }
PyramidExternalRessourceSourceTest >> testTargetSelectorArguments [

	| color newColor |
	color := PyramidExternalRessourceSource target: Color selector: #r:g:b: arguments: {1 . 0 . 0}.
	self assert: color getRessource equals: Color red.

	newColor := STON fromString: (STON toString: color).
	self assert: newColor getRessource equals: Color red
]
