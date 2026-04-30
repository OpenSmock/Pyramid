Class {
	#name : #PyramidUndoRemoveChildCommandTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #tests }
PyramidUndoRemoveChildCommandTest >> testUndoRemoveAllChildrenRestoresIndex [

	| history commandExecutor parent child1 child2 child3 child4|
	parent := BlElement new.
	child1 := BlElement new.
	child2 := BlElement new.
	child3 := BlElement new.
	child4 := BlElement new.
	parent addChildren: {child1. child2 .child3. child4}.

	history := PyramidHistory new.
	commandExecutor := PyramidHistoryCommandExecutor new
		                   history: history;
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself.
	commandExecutor
		use: PyramidRemoveSelectedElementsCommand new
		on: {
				child4.
				child2.
				child1 }
		with: { parent }.

	self deny: (parent children includes: child2).
	self deny: (parent children includes: child1).
	self deny: (parent children includes: child4).

	"Undo"
	history undo.

	self assert: (parent children includes: child1).
	self assert: (parent children includes: child2).
	self assert: (parent children indexOf: child1) equals: 1.
	self assert: (parent children indexOf: child2) equals: 2.
	self assert: (parent children indexOf: child4) equals: 4
]

{ #category : #tests }
PyramidUndoRemoveChildCommandTest >> testUndoRemoveChildRestoresIndex [

	| history commandExecutor parent child1 child2 child3 |
	
	parent := BlElement new.
	child1 := BlElement new.
	child2 := BlElement new.
	child3 := BlElement new.
	parent addChild: child1.
	parent addChild: child2.
	parent addChild: child3.
	
	history := PyramidHistory new.
	commandExecutor := PyramidHistoryCommandExecutor new
		                   history: history;
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself. 
		
	commandExecutor
		use: PyramidRemoveSelectedElementsCommand new
		on: { child2 }
		with: { parent }.
		
	self deny: (parent children includes: child2). 
	
	"Undo"
	history undo.
	
	self assert: (parent children includes: child2).
	self assert: (parent children indexOf: child2) equals: 2. 
	
	"Redo"
	history redo.
	
	self deny: (parent children includes: child2). 
	
	"Undo"
	history undo.
	
	self assert: (parent children includes: child2).
	self assert: (parent children indexOf: child2) equals: 2
]
