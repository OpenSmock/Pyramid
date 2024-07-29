Class {
	#name : #PyramidLayoutBlocCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidLayoutBlocCommandTest >> command [

	^ PyramidLayoutBlocCommand new
]

{ #category : #'as yet unclassified' }
PyramidLayoutBlocCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    layout: BlFlowLayout vertical;
					    yourself)
			   prop: BlFlowLayout vertical).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    layout: BlFlowLayout vertical;
					    yourself)
			   with: (BlElement new
					    layout: BlBasicLayout new;
					    yourself)
			   prop: BlBasicLayout new).
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    layout: BlProportionalLayout new;
					    yourself)
			   prop: BlProportionalLayout new) }
]
