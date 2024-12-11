Class {
	#name : #PyramidStampCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Toplo-Tests-cases-plugin-theme-management'
}

{ #category : #accessing }
PyramidStampCommandTest >> command [

	^ PyramidStampCommand new stamp: #test; yourself
]

{ #category : #'as yet unclassified' }
PyramidStampCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    addStamp: #test;
					    yourself)
			   prop: true).
		  (PyramidCommandTestContainer
			   no: (BlElement new  addStamp: #test; yourself)
			   with: BlElement new
			   prop: false) }
]
