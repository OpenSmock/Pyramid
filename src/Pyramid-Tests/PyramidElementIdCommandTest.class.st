Class {
	#name : #PyramidElementIdCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidElementIdCommandTest >> command [

		^ PyramidElementIdCommand new
]

{ #category : #'as yet unclassified' }
PyramidElementIdCommandTest >> targetContainers [


	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    id: #test;
					    yourself)
			   prop: 'test').
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    id: #old;
					    yourself)
			   with: (BlElement new
					    id: #new;
					    yourself)
			   prop: 'new') }
]
