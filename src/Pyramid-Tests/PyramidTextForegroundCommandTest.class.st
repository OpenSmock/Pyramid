Class {
	#name : 'PyramidTextForegroundCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidFontAttributeCommandTest',
	#classTraits : 'TPyramidFontAttributeCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-text',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc-text'
}

{ #category : 'as yet unclassified' }
PyramidTextForegroundCommandTest >> attributeClass [

	^ BlTextForegroundAttribute
]

{ #category : 'accessing' }
PyramidTextForegroundCommandTest >> command [

	^ PyramidTextForegroundCommand new
]

{ #category : 'as yet unclassified' }
PyramidTextForegroundCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: 'test1' asRopedText asElement
			   with: ('test1' asRopedText
						 foreground: Color red;
					    yourself) asElement
			   prop: Color red).
		  (PyramidCommandTestContainer
			   no: ('test2' asRopedText
						 foreground: Color red;
					    yourself) asElement
			   with: ('test2' asRopedText
					foreground: Color green;
					    yourself) asElement
			   prop: Color green).
		  (PyramidCommandTestContainer
			   no: ('test3' asRopedText
					    attribute: (BlFontSizeAttribute size: 20);
					    attribute: (BlTextForegroundAttribute color: Color green);
					    yourself) asElement
			   with: ('test3' asRopedText
					    attribute: (BlFontSizeAttribute size: 20);
					    attribute: (BlTextForegroundAttribute color: Color blue);
					    yourself) asElement
			   prop: Color blue) }
]
