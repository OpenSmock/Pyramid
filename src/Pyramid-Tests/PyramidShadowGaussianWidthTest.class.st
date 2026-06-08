Class {
	#name : #PyramidShadowGaussianWidthTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidShadowGaussianWidthTest >> command [

	^ PyramidShadowGaussianWidthCommand new
	
]

{ #category : #accessing }
PyramidShadowGaussianWidthTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new effect: BlGaussianShadowEffect new)
			   with: (BlElement new
					    effect: (BlGaussianShadowEffect color: Color red width: 5 offset: 2 @ 2);
					    yourself)
			   prop: 5).
		  (PyramidCommandTestContainer
			   no: (BlElement new effect: BlGaussianShadowEffect new)
			   with: (BlElement new
					    effect:
						    (BlGaussianShadowEffect
							     color: Color blue
							     width: 10
							     offset: 4 @ 4);
					    yourself)
			   prop: 10) }
]
