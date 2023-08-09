Class {
	#name : #PyramidFlowLayoutChangeOrientationCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidFlowLayoutChangeOrientationCommandTest >> command [

	^ PyramidFlowLayoutChangeOrientationCommand new
]

{ #category : #'as yet unclassified' }
PyramidFlowLayoutChangeOrientationCommandTest >> targetContainers [

	^ { (PyramidCommandTestContainer
		   no: (BlElement new
				    layout: BlFlowLayout horizontal;
				    yourself)
		   with: (BlElement new
				    layout: BlFlowLayout vertical;
				    yourself)
		   prop: BlLayoutOrientation vertical).
		(PyramidCommandTestContainer
		   no: (BlElement new
				    layout: BlFlowLayout vertical;
				    yourself)
		   with: (BlElement new
				    layout: BlFlowLayout horizontal;
				    yourself)
		   prop: BlLayoutOrientation horizontal).
		(PyramidCommandTestContainer
		   no: (BlElement new
				    layout: BlFlowLayout vertical;
				    yourself)
		   with: (BlElement new
				    layout: BlFlowLayout vertical;
				    yourself)
		   prop: BlLayoutOrientation vertical).
		(PyramidCommandTestContainer
		   no: (BlElement new
				    layout: BlFlowLayout horizontal;
				    yourself)
		   with: (BlElement new
				    layout: BlFlowLayout horizontal;
				    yourself)
		   prop: BlLayoutOrientation horizontal) }
]

{ #category : #'as yet unclassified' }
PyramidFlowLayoutChangeOrientationCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	^ {
		  nil.
		  false.
		  0.
		  $a.
		  BlElement new }
]
