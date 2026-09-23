Class {
	#name : #PyramidLayoutChangeOrientationCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidLayoutChangeOrientationCommandTest >> command [

	^ PyramidLayoutChangeOrientationCommand new
]

{ #category : #accessing }
PyramidLayoutChangeOrientationCommandTest >> targetContainers [

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

{ #category : #accessing }
PyramidLayoutChangeOrientationCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	^ {
		  nil.
		  false.
		  0.
		  $a.
		  BlElement new }
]
