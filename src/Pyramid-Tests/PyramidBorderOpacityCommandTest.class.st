Class {
	#name : 'PyramidBorderOpacityCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-visuals',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc-visuals'
}

{ #category : 'accessing' }
PyramidBorderOpacityCommandTest >> command [

	^ PyramidBorderOpacityCommand new
]

{ #category : 'as yet unclassified' }
PyramidBorderOpacityCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new border: (BlBorderBuilder new
						     build))
			   with: (BlElement new border: (BlBorderBuilder new
						     opacity: 0.4;
						     build))
			   prop: 0.4).
		  (PyramidCommandTestContainer
			   no: (BlElement new border: (BlBorderBuilder new
						     opacity: 1.0;
						     build))
			   with: (BlElement new border: (BlBorderBuilder new
						     opacity: 0.2;
						     build))
			   prop: 0.2) }
]
