Class {
	#name : 'PyramidBackgroundPaintRadialOuterCenterCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-visuals',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc-visuals'
}

{ #category : 'accessing' }
PyramidBackgroundPaintRadialOuterCenterCommandTest >> command [

	^ PyramidBackgroundPaintRadialOuterCenterCommand new
]

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintRadialOuterCenterCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    background: (BlRadialGradientPaint new
							     stops: {
									     (0.0 -> Color random).
									     (1.0 -> Color random) };
							     innerCenter: 50 @ 50;
							     innerRadius: 0;
							     outerCenter: 50 @ 50;
							     outerRadius: 50;
							     yourself) asBlBackground;
					    yourself)
			   with: (BlElement new
					    background: (BlRadialGradientPaint new
							     stops: {
									     (0.0 -> Color random).
									     (1.0 -> Color random) };
							     innerCenter: 50 @ 50;
							     innerRadius: 0;
							     outerCenter: 150 @ 50;
							     outerRadius: 50;
							     yourself) asBlBackground;
					    yourself)
			   prop: 150 @ 50).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    background: (BlRadialGradientPaint new
							     stops: {
									     (0.0 -> Color random).
									     (1.0 -> Color random) };
							     innerCenter: 50 @ 50;
							     innerRadius: 0;
							     outerCenter: 50 @ 50;
							     outerRadius: 10;
							     yourself) asBlBackground;
					    yourself)
			   with: (BlElement new
					    background: (BlRadialGradientPaint new
							     stops: {
									     (0.0 -> Color random).
									     (1.0 -> Color random) };
							     innerCenter: 50 @ 50;
							     innerRadius: 0;
							     outerCenter: 500 @ 500;
							     outerRadius: 10;
							     yourself) asBlBackground;
					    yourself)
			   prop: 500 asPoint) }
]

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintRadialOuterCenterCommandTest >> targetsCannotBeUsedFor [
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
