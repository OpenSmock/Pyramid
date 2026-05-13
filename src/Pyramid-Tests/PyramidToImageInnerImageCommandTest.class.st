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

    ^ { (PyramidCommandTestContainer
           no: ToImage new yourself
           with: (ToImage new 
                   innerImage: (Smalltalk ui icons iconNamed: #abstract);
                   yourself)
           prop: #abstract) }
]
