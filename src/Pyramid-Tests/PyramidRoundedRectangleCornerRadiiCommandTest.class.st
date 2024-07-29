Class {
	#name : #PyramidRoundedRectangleCornerRadiiCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-geometry'
}

{ #category : #accessing }
PyramidRoundedRectangleCornerRadiiCommandTest >> command [

	^ PyramidRoundedRectangleCornerRadiiCommand new
]

{ #category : #'as yet unclassified' }
PyramidRoundedRectangleCornerRadiiCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new geometry: BlRoundedRectangleGeometry new; yourself)
			   with: (BlElement new
					    geometry: (BlRoundedRectangleGeometry cornerRadius: 20);
					    yourself)
			   prop: (BlCornerRadii radius: 20)).
			(PyramidCommandTestContainer
			   no: (BlElement new geometry: (BlRoundedRectangleGeometry cornerRadius: 70); yourself)
			   with: (BlElement new
					    geometry: (BlRoundedRectangleGeometry cornerRadius: 20);
					    yourself)
			   prop: (BlCornerRadii radius: 20)) }
]

{ #category : #'as yet unclassified' }
PyramidRoundedRectangleCornerRadiiCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	^ { nil. false. 0. $a . BlElement new . BlElement new geometry: BlEllipseGeometry new}
]
