Class {
	#name : #PyramidShadowColorCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidShadowColorCommandTest >> command [

	^ PyramidShadowColorCommand new
]

{ #category : #accessing }
PyramidShadowColorCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new effect: BlSimpleShadowEffect new)
			   with: (BlElement new
					    effect: (BlSimpleShadowEffect color: Color red offset: 2 @ 2);
					    yourself)
			   prop: Color red).
		  (PyramidCommandTestContainer
			   no: (BlElement new effect: BlGaussianShadowEffect new)
			   with: (BlElement new
					    effect:
						    (BlGaussianShadowEffect
							     color: Color blue
							     width: 10
							     offset: 4 @ 4);
					    yourself)
			   prop: Color blue) }
]
