Class {
	#name : #PyramidShadowOffsetCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidShadowOffsetCommandTest >> command [

	^ PyramidShadowOffsetCommand new
]

{ #category : #accessing }
PyramidShadowOffsetCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new effect: BlSimpleShadowEffect new)
			   with: (BlElement new
					    effect: (BlSimpleShadowEffect color: Color red offset: 2 @ 2);
					    yourself)
			   prop: 2@2).
		  (PyramidCommandTestContainer
			   no: (BlElement new effect: BlGaussianShadowEffect new)
			   with: (BlElement new
					    effect:
						    (BlGaussianShadowEffect
							     color: Color blue
							     width: 10
							     offset: 4 @ 4);
					    yourself)
			   prop: 4@4) }
]
