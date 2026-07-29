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

{ #category : #accessing }
PyramidToImageInnerImageCommandTest >> targetContainers [

	| icon |
	icon := Smalltalk ui icons iconNamed: #add.
	PyramidMainExtension addIconName: #add forElementId: 'A_innerImage'.
	PyramidMainExtension addIconName: #add forElementId: 'nil_innerImage'.
	^ {
		  (PyramidCommandTestContainer
			   no: (ToImage new
					    id: 'A';
					    yourself)
			   with: (ToImage new
					    id: 'A';
					    innerImage: icon;
					    yourself)
			   prop: #add).
		  (PyramidCommandTestContainer
			   no: (ToImage
					    new)
			   with: (ToImage new
					    innerImage: icon;
					    yourself)
			   prop: #add) }
]
