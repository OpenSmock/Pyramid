Class {
	#name : #PyramidOpacityCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidOpacityCommandTest >> command [

	^ PyramidOpacityCommand new
]

{ #category : #'as yet unclassified' }
PyramidOpacityCommandTest >> targetContainers [

	| e1 e2 |
	e1 := BlElement new
		      background: Color red;
		      yourself.
	e1 background opacity: 0.4.
	e2 := BlElement new
		      background: Color red;
		      yourself.
	e2 background opacity: 0.3.

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new opacity: 0.4)
			   with: (BlElement new opacity: 0.2)
			   prop: 0.2).
		  (PyramidCommandTestContainer
			   no: (BlElement new)
			   with: (BlElement new opacity: 0.4)
			   prop: 0.4) }
]
