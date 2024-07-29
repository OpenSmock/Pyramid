Class {
	#name : #PyramidOnForegroundOrderCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-order'
}

{ #category : #accessing }
PyramidOnForegroundOrderCommandTest >> command [

	^ PyramidOnForegroundOrderCommand new
]

{ #category : #'as yet unclassified' }
PyramidOnForegroundOrderCommandTest >> makeElementWithChildren [

	| parent c1 c2 c3 |
	parent := BlElement new
		          id: #parent;
		          yourself.
	c1 := BlElement new
		      id: #c1;
		      yourself.
	c2 := BlElement new
		      id: #c2;
		      yourself.
	c3 := BlElement new
		      id: #c3;
		      yourself.
	parent addChildren: {
			c1.
			c2.
			c3 }.
	^ parent
]

{ #category : #'as yet unclassified' }
PyramidOnForegroundOrderCommandTest >> targetContainers [

	| test1 test2 test3 |
	test1 := self makeElementWithChildren.
	test2 := self makeElementWithChildren.
	test3 := self makeElementWithChildren.

	^ {
		  (PyramidCommandTestContainer
			   no: (test1 childAt: 1)
			   with: 1
			   prop: 3).
		  (PyramidCommandTestContainer
			   no: (test2 childAt: 2)
			   with: 2
			   prop: 3).
		  (PyramidCommandTestContainer
			   no: (test3 childAt: 3)
			   with: 3
			   prop: 3) }
]

{ #category : #'as yet unclassified' }
PyramidOnForegroundOrderCommandTest >> targetsCanBeUsedFor [

	^ self targetContainers flatCollect: [ :each |
		  {
			  each targetNoProp } ]
]

{ #category : #accessing }
PyramidOnForegroundOrderCommandTest >> targetsWithValuesAndValues [

	^ self targetContainers collect: [ :each |
		  each targetNoProp -> each targetWithProp ]
]
