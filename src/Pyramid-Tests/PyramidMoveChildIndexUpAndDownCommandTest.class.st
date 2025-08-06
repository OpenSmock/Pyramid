Class {
	#name : #PyramidMoveChildIndexUpAndDownCommandTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-edit-element-tree'
}

{ #category : #tests }
PyramidMoveChildIndexUpAndDownCommandTest >> testMoveChildIndexUpAndDownCommand4Element [

	| commandUp commandDown e e1 e2 e3 e4 indexAfter |
	commandUp := PyramidMoveChildIndexUpCommand new.
	commandDown := PyramidMoveChildIndexDownCommand new.

	e := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.

	e addChild: e1.
	e addChild: e2.
	e addChild: e3.
	e addChild: e4.

	"Up"
	commandUp setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: 2 equals: indexAfter.

	"Down"
	commandDown setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: 1 equals: indexAfter.

	"Up"
	commandUp setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: 2 equals: indexAfter.

	"Up"
	commandUp setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: 3 equals: indexAfter.

	"Up"
	commandUp setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: 4 equals: indexAfter.

	"Down"
	commandDown setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: 3 equals: indexAfter.

	"Down"
	commandDown setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: 2 equals: indexAfter.

	"Down"
	commandDown setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: 1 equals: indexAfter.

	self assert: indexAfter equals: 1
]
