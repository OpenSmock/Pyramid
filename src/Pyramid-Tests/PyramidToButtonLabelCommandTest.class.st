Class {
	#name : #PyramidToButtonLabelCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-editor'
}

{ #category : #accessing }
PyramidToButtonLabelCommandTest >> command [

^ PyramidToButtonLabelCommand new 
]

{ #category : #'as yet unclassified' }
PyramidToButtonLabelCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: ToButton new
			   with: (ToButton new
					    labelText: 'hello';
					    yourself)
			   prop: 'hello').

		  (PyramidCommandTestContainer
			   no: (ToButton new
					    labelText: 'hello';
					    yourself)
			   with: (ToButton new
					    labelText: 'pyramid';
					    yourself)
			   prop: 'pyramid') }
]
