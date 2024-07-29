Class {
	#name : #PyramidBackgroundPaintLinearEndCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBackgroundPaintLinearEndCommandTest >> command [

	^ PyramidBackgroundPaintLinearEndCommand new
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintLinearEndCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    background: (BlLinearGradientPaint new
							     stops: {
									     (0.0 -> Color red).
									     (1.0 -> Color blue) };
							     start: 0 @ 0;
							     end: 0 @ 50;
							     yourself) asBlBackground;
					    yourself)
			   with: (BlElement new
					    background: (BlLinearGradientPaint new
							     stops: {
									     (0.0 -> Color red).
									     (1.0 -> Color blue) };
							     start: 0 @ 0;
							     end: 50 @ 50;
							     yourself) asBlBackground;
					    yourself)
			   prop: 50 @ 50).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    background: (BlLinearGradientPaint new
							     stops: {
									     (0.0 -> Color red).
									     (1.0 -> Color blue) };
							     start: 0 @ 0;
							     end: 0 @ 50;
							     yourself) asBlBackground;
					    yourself)
			   with: (BlElement new
					    background: (BlLinearGradientPaint new
							     stops: {
									     (0.0 -> Color red).
									     (1.0 -> Color blue) };
							     start: 0 @ 00;
							     end: 0 @ 0;
							     yourself) asBlBackground;
					    yourself)
			   prop: 0 @ 0) }
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintLinearEndCommandTest >> targetsCannotBeUsedFor [
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
