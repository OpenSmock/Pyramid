Class {
	#name : #PyramidToImageInnerImageCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-editor'
}

{ #category : #accessing }
PyramidToImageInnerImageCommandTest >> command [

^ PyramidToImageInnerImageCommand new
]

{ #category : #'as yet unclassified' }
PyramidToImageInnerImageCommandTest >> targetContainers [

	| icon1 icon2 |
	icon1 := Smalltalk ui icons iconNamed: #add.
	icon2 := Smalltalk ui icons iconNamed: #remove.

	^ {
		  (PyramidCommandTestContainer
			   no: ToImage new
			   with: (ToImage new
					    innerImage: icon1;
					    yourself)
			   prop: #add).

		  (PyramidCommandTestContainer
			   no: (ToImage new
					    innerImage: icon1;
					    yourself)
			   with: (ToImage new
					    innerImage: icon2;
					    yourself)
			   prop: #remove) }
]
