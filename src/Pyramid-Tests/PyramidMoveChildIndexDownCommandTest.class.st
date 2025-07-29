Class {
	#name : #PyramidMoveChildIndexDownCommandTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-edit-element-tree'
}

{ #category : #tests }
PyramidMoveChildIndexDownCommandTest >> testMoveChildIndexDownCommand2Element [

	| command e e1 e2 indexBefore indexExpected indexAfter |
	
	command := PyramidMoveChildIndexDownCommand new. 
	
	e := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	
	e addChild: e1.
	e addChild: e2.
	
	indexBefore := e childIndexOf: e2.
	indexExpected := indexBefore - 1.
	command setValueFor: e with: e2.
	indexAfter := e childIndexOf: e2.
	self assert: indexExpected equals: indexAfter
]

{ #category : #tests }
PyramidMoveChildIndexDownCommandTest >> testMoveChildIndexDownCommand3Element [

	| command e e1 e2 e3 indexBefore indexExpected indexAfter |
	
	command := PyramidMoveChildIndexDownCommand new. 
	
	e := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	
	e addChild: e1.
	e addChild: e2.
	e addChild: e3.
	
	indexBefore := e childIndexOf: e3.
	indexExpected := indexBefore - 1.
	command setValueFor: e with: e3.
	indexAfter := e childIndexOf: e3.
	self assert: indexExpected equals: indexAfter.
	
	indexBefore := e childIndexOf: e3.
	indexExpected := indexBefore - 1.
	command setValueFor: e with: e3.
	indexAfter := e childIndexOf: e3.
	self assert: indexExpected equals: indexAfter
]

{ #category : #tests }
PyramidMoveChildIndexDownCommandTest >> testMoveChildIndexDownCommand4Element [

	| command e e1 e2 e3 e4 indexBefore indexExpected indexAfter |
	
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
	
	indexBefore := e childIndexOf: e4.
	indexExpected := indexBefore - 1.
	command setValueFor: e with: e4.
	indexAfter := e childIndexOf: e4.
	self assert: indexExpected equals: indexAfter.
	
	indexBefore := e childIndexOf: e4.
	indexExpected := indexBefore - 1.
	command setValueFor: e with: e4.
	indexAfter := e childIndexOf: e4.
	self assert: indexExpected equals: indexAfter.
	
	indexBefore := e childIndexOf: e4.
	indexExpected := indexBefore - 1.
	command setValueFor: e with: e4.
	indexAfter := e childIndexOf: e4.
	self assert: indexExpected equals: indexAfter
]
