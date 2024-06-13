Class {
	#name : 'PyramidBackgroundOpacityCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-visuals',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc-visuals'
}

{ #category : 'accessing' }
PyramidBackgroundOpacityCommandTest >> command [

	^ PyramidBackgroundOpacityCommand new
]

{ #category : 'as yet unclassified' }
PyramidBackgroundOpacityCommandTest >> targetContainers [

	| e1 e2 |
	e1 := (BlElement new background: Color red; yourself).
	e1 background opacity: 0.4.
	e2 := (BlElement new background: Color red; yourself).
	e2 background opacity: 0.3.

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new background: Color red)
			   with: e1
			   prop: 0.4).
		  (PyramidCommandTestContainer
			   no: (BlElement new background: Color red)
			   with: e2
			   prop: 0.3) }
]
