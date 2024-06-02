Class {
	#name : 'PyramidVisibilityCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc'
}

{ #category : 'accessing' }
PyramidVisibilityCommandTest >> command [

	^ PyramidVisibilityCommand new.
]

{ #category : 'as yet unclassified' }
PyramidVisibilityCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    visibility: BlVisibility gone;
					    yourself)
			   prop: BlVisibility gone).
			 (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    visibility: BlVisibility hidden;
					    yourself)
			   prop: BlVisibility hidden).
			 (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    visibility: BlVisibility visible;
					    yourself)
			   prop: BlVisibility visible).
			(PyramidCommandTestContainer
			   no: (BlElement new visibility: BlVisibility gone; yourself)
			   with: (BlElement new
					    visibility: BlVisibility visible;
					    yourself)
			   prop: BlVisibility visible) }
]
