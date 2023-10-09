Class {
	#name : 'PyramidGeometryCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-geometry',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc-geometry'
}

{ #category : 'accessing' }
PyramidGeometryCommandTest >> command [

	^ PyramidGeometryCommand new
]

{ #category : 'as yet unclassified' }
PyramidGeometryCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    geometry: BlEllipseGeometry new;
					    yourself)
			   prop: BlEllipseGeometry new).
			  (PyramidCommandTestContainer
			   no: (BlElement new  geometry: BlEllipseGeometry new; yourself)
			   with: (BlElement new
					    geometry: BlRectangleGeometry new;
					    yourself)
			   prop: BlRectangleGeometry new).
		   }
]
