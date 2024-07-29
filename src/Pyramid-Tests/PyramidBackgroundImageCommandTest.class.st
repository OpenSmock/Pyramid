Class {
	#name : #PyramidBackgroundImageCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBackgroundImageCommandTest >> command [

	^ PyramidBackgroundImageCommand new
]

{ #category : #'as yet unclassified' }
PyramidBackgroundImageCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    background: (BlBackground image: (Smalltalk ui icons iconNamed: #add));
					    yourself)
			   with: (BlElement new
					    background: (BlBackground image: (Smalltalk ui icons iconNamed: #remove));
					    yourself)
			   prop: (Smalltalk ui icons iconNamed: #remove)).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    background: (BlBackground image: (Smalltalk ui icons iconNamed: #add));
					    yourself)
			   with: (BlElement new
					    background: (BlBackground image: (Smalltalk ui icons iconNamed: #pharoBig));
					    yourself)
			   prop: (Smalltalk ui icons iconNamed: #pharoBig)) }
]

{ #category : #'as yet unclassified' }
PyramidBackgroundImageCommandTest >> targetsCannotBeUsedFor [
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
