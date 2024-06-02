Class {
	#name : 'PyramidFontSizeCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidFontAttributeCommandTest',
	#classTraits : 'TPyramidFontAttributeCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-text',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc-text'
}

{ #category : 'as yet unclassified' }
PyramidFontSizeCommandTest >> attributeClass [

	^ BlFontSizeAttribute
]

{ #category : 'accessing' }
PyramidFontSizeCommandTest >> command [

	^ PyramidFontSizeCommand new
]

{ #category : 'as yet unclassified' }
PyramidFontSizeCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: 'test1' asRopedText asElement
			   with: ('test1' asRopedText
					    fontSize: 20;
					    yourself) asElement
			   prop: 20).
		  (PyramidCommandTestContainer
			   no: ('test2' asRopedText
					    fontSize: 20;
					    yourself) asElement
			   with: ('test2' asRopedText
					     fontSize: 5;
					    yourself) asElement
			   prop: 5).
		  (PyramidCommandTestContainer
			   no: ('test3' asRopedText
					     bold;
					    attribute: (BlFontSizeAttribute size: 20);
					    attribute: (BlTextForegroundAttribute color: Color green);
					    yourself) asElement
			   with: ('test3' asRopedText
					    bold;
					    attribute: (BlFontSizeAttribute size: 30);
					    attribute: (BlTextForegroundAttribute color: Color green);
					    yourself) asElement
			   prop: 30) }
]
