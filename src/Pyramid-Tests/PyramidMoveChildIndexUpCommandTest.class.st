Class {
	#name : #PyramidMoveChildIndexUpCommandTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-edit-element-tree'
}

{ #category : #tests }
PyramidMoveChildIndexUpCommandTest >> testMoveChildIndexUpCommand2Element [

	| command e e1 e2 indexBefore indexExpected indexAfter |
	
	command := PyramidMoveChildIndexUpCommand new. 
	
	e := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	
	e addChild: e1.
	e addChild: e2.
	
	indexBefore := e childIndexOf: e1.
	indexExpected := indexBefore + 1.
	command setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: indexExpected equals: indexAfter
]

{ #category : #tests }
PyramidMoveChildIndexUpCommandTest >> testMoveChildIndexUpCommand3Element [

	| command e e1 e2 e3 indexBefore indexExpected indexAfter |
	
	command := PyramidMoveChildIndexUpCommand new. 
	
	e := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	
	e addChild: e1.
	e addChild: e2.
	e addChild: e3.
	
	indexBefore := e childIndexOf: e1.
	indexExpected := indexBefore + 1.
	command setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: indexExpected equals: indexAfter.
	
	indexBefore := e childIndexOf: e1.
	indexExpected := indexBefore + 1.
	command setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: indexExpected equals: indexAfter
]

{ #category : #tests }
PyramidMoveChildIndexUpCommandTest >> testMoveChildIndexUpCommand4Element [

	| command e e1 e2 e3 e4 indexBefore indexExpected indexAfter |
	
	command := PyramidMoveChildIndexUpCommand new. 
	
	e := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.
	
	e addChild: e1.
	e addChild: e2.
	e addChild: e3.
	e addChild: e4.
	
	indexBefore := e childIndexOf: e1.
	indexExpected := indexBefore + 1.
	command setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: indexExpected equals: indexAfter.
	
	indexBefore := e childIndexOf: e1.
	indexExpected := indexBefore + 1.
	command setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: indexExpected equals: indexAfter.
	
	indexBefore := e childIndexOf: e1.
	indexExpected := indexBefore + 1.
	command setValueFor: e with: e1.
	indexAfter := e childIndexOf: e1.
	self assert: indexExpected equals: indexAfter
]
