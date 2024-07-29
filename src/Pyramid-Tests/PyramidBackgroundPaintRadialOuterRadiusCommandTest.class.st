Class {
	#name : #PyramidBackgroundPaintRadialOuterRadiusCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBackgroundPaintRadialOuterRadiusCommandTest >> command [

	^ PyramidBackgroundPaintRadialOuterRadiusCommand new
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintRadialOuterRadiusCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new background: (BlRadialGradientPaint new
					    stops: {
							    (0.0 -> Color random).
							    (1.0 -> Color random) };
					    innerCenter: 50 @ 50;
					    innerRadius: 0;
					    outerCenter: 50 @ 50;
					    outerRadius: 50;
					    yourself) asBlBackground; yourself)
			   with: (BlElement new background: (BlRadialGradientPaint new
					    stops: {
							    (0.0 -> Color random).
							    (1.0 -> Color random) };
					    innerCenter: 50 @ 50;
					    innerRadius: 0;
					    outerCenter: 50 @ 50;
					    outerRadius: 100;
					    yourself)asBlBackground; yourself)
			   prop: 100).
		  (PyramidCommandTestContainer
			   no: (BlElement new background: (BlRadialGradientPaint new
					    stops: {
							    (0.0 -> Color random).
							    (1.0 -> Color random) };
					    innerCenter: 50 @ 50;
					    innerRadius: 0;
					    outerCenter: 50 @ 50;
					    outerRadius: 10;
					    yourself)asBlBackground; yourself)
			   with:  (BlElement new background: (BlRadialGradientPaint new
					    stops: {
							    (0.0 -> Color random).
							    (1.0 -> Color random) };
					    innerCenter: 50 @ 50;
					    innerRadius: 0;
					    outerCenter: 50 @ 50;
					    outerRadius: 600;
					    yourself)asBlBackground; yourself)
			   prop: 600) }
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintRadialOuterRadiusCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	^ {
		  nil.
		  false.
		  0.
		  $a.
		  (BlElement new
			   background: (BlLinearGradientPaint vertical
					    stops: {
							    (0.0 -> Color random).
							    (1.0 -> Color random) };
					    yourself) asBlBackground;
			   yourself).
		  BlElement new
			   background:(BlColorPaint new
			   color: Color random;
			   yourself) asBlBackground; yourself }
]
