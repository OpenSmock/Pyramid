Class {
	#name : 'PyramidBorderLineJoinCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-visuals',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc-visuals'
}

{ #category : 'accessing' }
PyramidBorderLineJoinCommandTest >> command [

	^ PyramidBorderLineJoinCommand new
]

{ #category : 'as yet unclassified' }
PyramidBorderLineJoinCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new border: (BlBorderBuilder new
						     joinBevel;
						     build))
			   prop: BlStrokeLineJoin bevel).
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new border: (BlBorderBuilder new
						     joinRound;
						     build))
			   prop: BlStrokeLineJoin round).
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new border: (BlBorderBuilder new
						     joinMiter;
						     build))
			   prop: BlStrokeLineJoin miter) }
]
