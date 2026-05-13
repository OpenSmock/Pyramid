Class {
	#name : #PyramidToLabelTextCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-editor'
}

{ #category : #accessing }
PyramidToLabelTextCommandTest >> command [

	^ PyramidToLabelTextCommand new
]

{ #category : #'as yet unclassified' }
PyramidToLabelTextCommandTest >> targetContainers [

	^ { (PyramidCommandTestContainer
		   no: ToLabel new yourself
		   with: (ToLabel new
				    text: 'hello';
				    yourself)
		   prop: 'hello') }
]
