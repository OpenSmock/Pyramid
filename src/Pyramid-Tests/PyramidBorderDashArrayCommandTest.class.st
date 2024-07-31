Class {
	#name : #PyramidBorderDashArrayCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBorderDashArrayCommandTest >> command [

	^ PyramidBorderDashArrayCommand new
]

{ #category : #'as yet unclassified' }
PyramidBorderDashArrayCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new border: (BlBorderBuilder new
						     dashArray: #( 1 );
						     build))
			   prop: #( 1 )).
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new border: (BlBorderBuilder new
						     dashArray: #( 1 2 3 4 );
						     build))
			   prop: #( 1 2 3 4 )).
		  (PyramidCommandTestContainer
			   no: (BlElement new border: (BlBorderBuilder new
						     dashArray: #( 1 2 3 4 );
						     build))
			   with: BlElement new
			   prop: #(  )) }
]
