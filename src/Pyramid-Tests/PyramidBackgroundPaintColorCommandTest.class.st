Class {
	#name : #PyramidBackgroundPaintColorCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBackgroundPaintColorCommandTest >> command [

	^ PyramidBackgroundPaintColorCommand new
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintColorCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    background: Color red;
					    yourself)
			   with: (BlElement new
					    background: Color blue;
					    yourself)
			   prop: Color blue).
			(PyramidCommandTestContainer
			   no: (BlElement new
					    background: Color red;
					    yourself)
			   with: (BlElement new
					    background: Color green;
					    yourself)
			   prop: Color green)
		   }
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintColorCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	^ { nil. false. 0. $a . (BlElement new
					    background: (BlRadialGradientPaint new
							     stops: {
									     (0.0 -> Color random).
									     (1.0 -> Color random) };
							     innerCenter: 50 @ 50;
							     innerRadius: 0;
							     outerCenter: 50 @ 50;
							     outerRadius: 50;
							     yourself) asBlBackground;
					    yourself)}
]
