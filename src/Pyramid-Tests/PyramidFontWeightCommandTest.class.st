Class {
	#name : #PyramidFontWeightCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidFontAttributeCommandTest',
	#classTraits : 'TPyramidFontAttributeCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-text'
}

{ #category : #'as yet unclassified' }
PyramidFontWeightCommandTest >> attributeClass [

	^ BlFontWeightAttribute
]

{ #category : #accessing }
PyramidFontWeightCommandTest >> command [

	^ PyramidFontWeightCommand new
]

{ #category : #'as yet unclassified' }
PyramidFontWeightCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: 'test1' asRopedText asElement
			   with: ('test1' asRopedText
					    black;
					    yourself) asElement
			   prop: LogicalFont weightBlack).
		  (PyramidCommandTestContainer
			   no: ('test2' asRopedText
					    black;
					    yourself) asElement
			   with: ('test2' asRopedText
					    thin;
					    yourself) asElement
			   prop: LogicalFont weightThin).
		  (PyramidCommandTestContainer
			   no: ('test3' asRopedText
					    bold;
					    attribute: (BlFontSizeAttribute size: 20);
					    attribute: (BlTextForegroundAttribute color: Color green);
					    yourself) asElement
			   with: ('test3' asRopedText
					    thin;
					    attribute: (BlFontSizeAttribute size: 20);
					    attribute: (BlTextForegroundAttribute color: Color green);
					    yourself) asElement
			   prop: LogicalFont weightThin) }
]
