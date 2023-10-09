Class {
	#name : 'PyramidPaddingCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc'
}

{ #category : 'accessing' }
PyramidPaddingCommandTest >> command [

	^ PyramidPaddingCommand new
]

{ #category : 'as yet unclassified' }
PyramidPaddingCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    padding: (BlInsets all: 1);
					    yourself)
			   prop: (BlInsets all: 1)).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    padding: (BlInsets all: 1);
					    yourself)
			   with: (BlElement new
					    padding: (BlInsets all: 2);
					    yourself)
			   prop: (BlInsets all: 2)).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    padding: (BlInsets top: 1);
					    yourself)
			   with: (BlElement new
					    padding: (BlInsets left: 42);
					    yourself)
			   prop: (BlInsets left: 42)) }
]
