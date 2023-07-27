Class {
	#name : #PyramidBackgroundCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidBackgroundCommandTest >> command [

	^ PyramidBackgroundCommand new
]

{ #category : #'as yet unclassified' }
PyramidBackgroundCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    background: BlTransparentBackground new;
					    yourself)
			   prop: BlTransparentBackground new).
			(PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    background: BlTransparentBackground new;
					    yourself)
			   prop: BlTransparentBackground new).
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    background:(BlImageBackground image: (self iconNamed: #add));
					    yourself)
			   prop: (BlImageBackground image: (self iconNamed: #add))).
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    background: (BlPaintBackground new paint:
								     (BlLinearGradientPaint vertical stops: {
											      (0.2 -> Color yellow).
											      (0.5 -> Color black).
											      (1 -> Color orange) }));
					    yourself)
			   prop: (BlPaintBackground new paint:
					    (BlLinearGradientPaint vertical stops: {
							     (0.2 -> Color yellow).
							     (0.5 -> Color black).
							     (1 -> Color orange) }))) }
]
