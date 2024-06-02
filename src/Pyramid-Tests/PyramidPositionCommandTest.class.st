Class {
	#name : 'PyramidPositionCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc'
}

{ #category : 'accessing' }
PyramidPositionCommandTest >> command [

	^ PyramidPositionCommand new
]

{ #category : 'as yet unclassified' }
PyramidPositionCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    position: 50 @ 50;
					    yourself)
			   prop: 50 @ 50).
			 (PyramidCommandTestContainer 
			   no: (BlElement new position: 50 @ 50; yourself)
			   with: (BlElement new
					    position: 400 @ 0;
					    yourself)
			   prop: 400 @ 0). }
]
