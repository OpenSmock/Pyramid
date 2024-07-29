Class {
	#name : #PyramidClipChildrenCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidClipChildrenCommandTest >> command [

	^ PyramidClipChildrenCommand new
]

{ #category : #'as yet unclassified' }
PyramidClipChildrenCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    clipChildren: true;
					    yourself)
			   prop: true).
			(PyramidCommandTestContainer
			   no: (BlElement new clipChildren: true; yourself)
			   with: (BlElement new
					    clipChildren: true;
					    yourself)
			   prop: true).
			(PyramidCommandTestContainer
			   no:  (BlElement new clipChildren: true; yourself)
			   with: (BlElement new
					    clipChildren: false;
					    yourself)
			   prop: false).
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    clipChildren: false;
					    yourself)
			   prop: false). }
]
