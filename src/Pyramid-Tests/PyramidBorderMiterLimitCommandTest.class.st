Class {
	#name : #PyramidBorderMiterLimitCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBorderMiterLimitCommandTest >> command [

	^ PyramidBorderMiterLimitCommand new
]

{ #category : #'as yet unclassified' }
PyramidBorderMiterLimitCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new border: (BlBorderBuilder new
						     miterLimit: 1.0;
						     build))
			   with: (BlElement new border: (BlBorderBuilder new
						     miterLimit: 4.0;
						     build))
			   prop: 4.0).
		  (PyramidCommandTestContainer
			   no: (BlElement new border: (BlBorderBuilder new
						     miterLimit: 100;
						     build))
			   with: (BlElement new border: (BlBorderBuilder new
						     miterLimit: 10;
						     build))
			   prop: 10) }
]
