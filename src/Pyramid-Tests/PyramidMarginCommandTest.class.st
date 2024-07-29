Class {
	#name : #PyramidMarginCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidMarginCommandTest >> command [

	^ PyramidMarginCommand new
]

{ #category : #'as yet unclassified' }
PyramidMarginCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    margin: (BlInsets all: 1);
					    yourself)
			   prop: (BlInsets all: 1)).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    margin: (BlInsets all: 1);
					    yourself)
			   with: (BlElement new
					    margin: (BlInsets all: 2);
					    yourself)
			   prop: (BlInsets all: 2)).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    margin: (BlInsets top: 1);
					    yourself)
			   with: (BlElement new
					    margin: (BlInsets left: 42);
					    yourself)
			   prop: (BlInsets left: 42))}
]
