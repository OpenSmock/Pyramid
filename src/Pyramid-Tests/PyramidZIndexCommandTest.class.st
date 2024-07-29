Class {
	#name : #PyramidZIndexCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidZIndexCommandTest >> command [

	^ PyramidZIndexCommand new.
]

{ #category : #'as yet unclassified' }
PyramidZIndexCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    zIndex: 100;
					    yourself)
			   prop: 100).
			(PyramidCommandTestContainer
			   no: (BlElement new zIndex: 100; yourself)
			   with: (BlElement new
					    zIndex: 50;
					    yourself)
			   prop: 50).
			(PyramidCommandTestContainer
			   no: (BlElement new zIndex: 25; yourself)
			   with: (BlElement new
					    zIndex: 50;
					    yourself)
			   prop: 50).
			  }
]
