Class {
	#name : #PyramidBorderLineCapCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBorderLineCapCommandTest >> command [

	^ PyramidBorderLineCapCommand new
]

{ #category : #'as yet unclassified' }
PyramidBorderLineCapCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new border: (BlBorderBuilder new
						     capButt;
						     build))
			   prop: BlStrokeLineCap butt).
			 (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new border: (BlBorderBuilder new
						     capRound;
						     build))
			   prop: BlStrokeLineCap round).
			 (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new border: (BlBorderBuilder new
						     capSquare;
						     build))
			   prop: BlStrokeLineCap square) }
]
