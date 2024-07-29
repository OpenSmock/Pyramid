Class {
	#name : #PyramidChangeTextCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-text'
}

{ #category : #accessing }
PyramidChangeTextCommandTest >> command [

	^ PyramidChangeTextCommand new
]

{ #category : #'as yet unclassified' }
PyramidChangeTextCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlTextElement new
			   with: 'test1' asRopedText asElement
			   prop: 'test1').
		  (PyramidCommandTestContainer
			   no: 'hello' asRopedText asElement
			   with: 'test2' asRopedText asElement
			   prop: 'test2').
		  (PyramidCommandTestContainer
			   no: ('I am BOLD' asRopedText
					    bold;
					    attribute: (BlFontSizeAttribute size: 20);
					    attribute: (BlTextForegroundAttribute color: Color green);
					    yourself) asElement
			   with: ('test3' asRopedText
					    bold;
					    attribute: (BlFontSizeAttribute size: 20);
					    attribute: (BlTextForegroundAttribute color: Color green);
					    yourself) asElement
			   prop: 'test3') }
]

{ #category : #tests }
PyramidChangeTextCommandTest >> testSetValueForWith [

	| attributes |
	self targetsWithoutValuesAndValues do: [ :each |
		attributes := (each key text attributesFinder
			               attributesAndIndicesSuchThat: [ :a | true ])
			              collect: [ :a | a key ].
		self command setValueFor: each key with: each value.
		self assert: (self command getValueFor: each key) equals: each value.
		self
			assert:
				((each key text attributesFinder attributesAndIndicesSuchThat: [
					  :a | true ]) collect: [ :a | a key ])
			equals: attributes ]
]
