Class {
	#name : 'PyramidChangeOrderWithIndexCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-order',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc-order'
}

{ #category : 'accessing' }
PyramidChangeOrderWithIndexCommandTest >> command [

	^ PyramidChangeOrderWithIndexCommand new
]

{ #category : 'as yet unclassified' }
PyramidChangeOrderWithIndexCommandTest >> makeElementWithChildren [

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

{ #category : 'as yet unclassified' }
PyramidChangeOrderWithIndexCommandTest >> targetContainers [

	| test1 test2 test3 test4 test5 test6 |
	test1 := self makeElementWithChildren.
	test2 := self makeElementWithChildren.
	test3 := self makeElementWithChildren.
	test4 := self makeElementWithChildren.
	test5 := self makeElementWithChildren.
	test6 := self makeElementWithChildren.

	^ {
		  (PyramidCommandTestContainer
			   no: (test1 childAt: 1)
			   with: 1
			   prop: 1).
		  (PyramidCommandTestContainer
			   no: (test2 childAt: 1)
			   with: 1
			   prop: 2).
		  (PyramidCommandTestContainer
			   no: (test3 childAt: 1)
			   with: 1
			   prop: 3).
		  (PyramidCommandTestContainer
			   no: (test4 childAt: 3)
			   with: 3
			   prop: 3).
		  (PyramidCommandTestContainer
			   no: (test5 childAt: 3)
			   with: 3
			   prop: 2).
		  (PyramidCommandTestContainer
			   no: (test4 childAt: 3)
			   with: 3
			   prop: 1) }
]

{ #category : 'as yet unclassified' }
PyramidChangeOrderWithIndexCommandTest >> targetsCanBeUsedFor [

	^ self targetContainers flatCollect: [ :each |
		  {
			  each targetNoProp } ]
]

{ #category : 'accessing' }
PyramidChangeOrderWithIndexCommandTest >> targetsWithValuesAndValues [

	^ self targetContainers collect: [ :each |
		  each targetNoProp -> each targetWithProp ]
]

{ #category : 'tests' }
PyramidChangeOrderWithIndexCommandTest >> testGetValueFor [

	self targetsWithValuesAndValues do: [ :each |
		self assert: (self command getValueFor: each key) equals: each value ]
]
