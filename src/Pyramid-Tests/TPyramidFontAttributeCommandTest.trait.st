Trait {
	#name : 'TPyramidFontAttributeCommandTest',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-text',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc-text'
}

{ #category : 'as yet unclassified' }
TPyramidFontAttributeCommandTest >> attributeClass [

	^ self shouldBeImplemented
]

{ #category : 'tests' }
TPyramidFontAttributeCommandTest >> testSetValueForWith [

	| attributes |
	self targetsWithoutValuesAndValues do: [ :each |
		attributes := (each key text attributesFinder
			               attributesAndIndicesSuchThat: [ :a |
			               self attributeClass ~= a class ]) collect: [ :a |
			              a key ].
		self command setValueFor: each key with: each value.
		self assert: (self command getValueFor: each key) equals: each value.
		self
			assert:
				((each key text attributesFinder attributesAndIndicesSuchThat: [
					  :a | true ])
					 collect: [ :a | a key ]
					 thenSelect: [ :a | self attributeClass ~= a class ])
			equals: attributes ]
]
