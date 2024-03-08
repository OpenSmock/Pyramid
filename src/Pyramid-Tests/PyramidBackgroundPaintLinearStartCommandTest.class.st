Class {
	#name : #PyramidBackgroundPaintLinearStartCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-background'
}

{ #category : #accessing }
PyramidBackgroundPaintLinearStartCommandTest >> command [

	^ PyramidBackgroundPaintLinearStartCommand new
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintLinearStartCommandTest >> targetContainers [

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
									     (1.0 -> Color blue) }; start: 50 @ 0;
					    end: 0 @ 50;
							     yourself) asBlBackground;
					   
					    yourself)
			   prop: 50 @ 0).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    background: (BlLinearGradientPaint new
							     stops: {
									     (0.0 -> Color red).
									     (1.0 -> Color blue) };start: 0 @ 0;
					    end: 0 @ 50;
							     yourself) asBlBackground;
					    
					    yourself)
			   with: (BlElement new
					    background: (BlLinearGradientPaint new
							     stops: {
									     (0.0 -> Color red).
									     (1.0 -> Color blue) }; start: 0 @ 10;
					    end: 0 @ 50;
							     yourself) asBlBackground;
					   
					    yourself)
			   prop: 0 @ 10) }
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintLinearStartCommandTest >> targetsCannotBeUsedFor [
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
