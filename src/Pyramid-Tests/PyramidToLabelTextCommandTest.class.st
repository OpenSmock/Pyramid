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

	^ {

		  (PyramidCommandTestContainer
			   no: ToLabel new
			   with: (ToLabel new
					    text: 'hello';
					    yourself)
			   prop: 'hello').

		  (PyramidCommandTestContainer
			   no: (ToLabel new
					    text: 'hello';
					    yourself)
			   with: (ToLabel new
					    text: 'pyramid';
					    yourself)
			   prop: 'pyramid') }
]
