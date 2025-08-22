Class {
	#name : #PyramidMoveChildIndexDownCommandTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-edit-element-tree'
}

{ #category : #tests }
PyramidMoveChildIndexDownCommandTest >> testMoveChildIndexDownCommand2Element [

	| command e e1 e2 indexAfter |
	command := PyramidMoveChildIndexDownCommand new.

	e := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.

	e addChild: e1.
	e addChild: e2.

	command setValueFor: e with: e2.
	indexAfter := e childIndexOf: e2.
	self assert: 1 equals: indexAfter
]

{ #category : #tests }
PyramidMoveChildIndexDownCommandTest >> testMoveChildIndexDownCommand3Element [

	| command e e1 e2 e3 indexAfter |
	command := PyramidMoveChildIndexDownCommand new.

	e := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.

	e addChild: e1.
	e addChild: e2.
	e addChild: e3.

	command setValueFor: e with: e3.
	indexAfter := e childIndexOf: e3.
	self assert: 2 equals: indexAfter.

	command setValueFor: e with: e3.
	indexAfter := e childIndexOf: e3.
	self assert: 1 equals: indexAfter
]

{ #category : #tests }
PyramidMoveChildIndexDownCommandTest >> testMoveChildIndexDownCommand4Element [

	| command e e1 e2 e3 e4 indexAfter |
	command := PyramidMoveChildIndexDownCommand new.

	e := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.

	e addChild: e1.
	e addChild: e2.
	e addChild: e3.
	e addChild: e4.

	self assert: 3 equals: (e childIndexOf: e3).
	command setValueFor: e with: e4.
	indexAfter := e childIndexOf: e4.
	self assert: 3 equals: indexAfter.
	self assert: 4 equals: (e childIndexOf: e3).

	self assert: 2 equals: (e childIndexOf: e2).
	command setValueFor: e with: e4.
	indexAfter := e childIndexOf: e4.
	self assert: 2 equals: indexAfter.
	self assert: 3 equals: (e childIndexOf: e2).

	self assert: 1 equals: (e childIndexOf: e1).
	command setValueFor: e with: e4.
	indexAfter := e childIndexOf: e4.
	self assert: 1 equals: indexAfter.
	self assert: 2 equals: (e childIndexOf: e1)
]
