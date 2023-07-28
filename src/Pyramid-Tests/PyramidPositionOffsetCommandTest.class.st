Class {
	#name : #PyramidPositionOffsetCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidPositionOffsetCommandTest >> command [

	^ PyramidPositionOffsetCommand new
]

{ #category : #'as yet unclassified' }
PyramidPositionOffsetCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    position: 50 @ 50;
					    yourself)
			   prop: 50 @ 50).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    position: 50 @ 50;
					    yourself)
			   with: (BlElement new
					    position: 100 @ 100;
					    yourself)
			   prop: 50 @ 50) }
]

{ #category : #accessing }
PyramidPositionOffsetCommandTest >> targetsWithValuesAndValues [

	^ self targetContainers collect: [ :each |
		  each targetWithProp -> each targetWithProp constraints position ]
]

{ #category : #tests }
PyramidPositionOffsetCommandTest >> testSetValueForWith [

	self targetsWithoutValuesAndValues do: [ :each |
		| initialValue |
		initialValue := self command getValueFor: each key.
		self command setValueFor: each key with: each value.
		self assert: (self command getValueFor: each key) equals: each value + initialValue ]
]
