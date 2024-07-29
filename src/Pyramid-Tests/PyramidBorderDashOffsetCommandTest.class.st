Class {
	#name : #PyramidBorderDashOffsetCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBorderDashOffsetCommandTest >> command [

	^ PyramidBorderDashOffsetCommand new
]

{ #category : #'as yet unclassified' }
PyramidBorderDashOffsetCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new border: (BlBorderBuilder new
						     dashArray: #( 1 );
						     build))
			   with: (BlElement new border: (BlBorderBuilder new
						     dashArray: #( 1 );
						     dashOffset: 1;
						     build))
			   prop: 1).
		  (PyramidCommandTestContainer
			   no: (BlElement new border: (BlBorderBuilder new
						     dashArray: #( 1 );
						     build))
			   with: (BlElement new border: (BlBorderBuilder new
						     dashOffset: 4;
						     dashArray: #( 1 );
						     build))
			   prop: 4).
		  (PyramidCommandTestContainer
			   no: (BlElement new border: (BlBorderBuilder new
						     dashOffset: 1;
						     dashArray: #( 1 );
						     build))
			   with: (BlElement new border: (BlBorderBuilder new
						     dashArray: #( 1 );
						     build))
			   prop: 0) }.
]
