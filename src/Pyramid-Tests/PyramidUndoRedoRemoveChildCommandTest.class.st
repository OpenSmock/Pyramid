Class {
	#name : #PyramidUndoRedoRemoveChildCommandTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #tests }
PyramidUndoRedoRemoveChildCommandTest >> testUndoRedoUndoRemoveChildRestoresIndex [

	| history commandExecutor parent child1 child2 child3 |
	parent := BlElement new
		          layout: BlFlowLayout new;
		          yourself.
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
	self assert: (child2 userData at: #pyramidRemovedAtIndex) equals: 2.

	"Undo"
	history undo.
	self assert: (parent children includes: child2).
	self deny: (child2 userData includesKey: #pyramidRemovedAtIndex).

	"Redo"
	history redo.
	self deny: (parent children includes: child2).
	self assert: (child2 userData at: #pyramidRemovedAtIndex) equals: 2.

	"Undo"
	history undo.
	self assert: (parent children includes: child2).
	self assert: (parent children indexOf: child2) equals: 2.
	self assert: (parent children indexOf: child1) equals: 1.
	self assert: (parent children indexOf: child3) equals: 3
]

{ #category : #tests }
PyramidUndoRedoRemoveChildCommandTest >> testUndoRedoUndoRemoveMultipleChildrenRestoresIndex [

	| history commandExecutor parent child1 child2 child3 child4 child5 child6 |
	parent := BlElement new
		          layout: BlFlowLayout new;
		          yourself.
	child1 := BlElement new.
	child2 := BlElement new.
	child3 := BlElement new.
	child4 := BlElement new.
	child5 := BlElement new.
	child6 := BlElement new.
	parent addChild: child1.
	parent addChild: child2.
	parent addChild: child3.
	parent addChild: child4.
	parent addChild: child5.
	parent addChild: child6.

	history := PyramidHistory new.
	commandExecutor := PyramidHistoryCommandExecutor new
		                   history: history;
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself.

	commandExecutor
		use: PyramidRemoveSelectedElementsCommand new
		on: {
				child6.
				child1.
				child4.
				child3 }
		with: { parent }.
	self deny: (parent children includes: child1).
	self deny: (parent children includes: child3).
	self deny: (parent children includes: child4).
	self deny: (parent children includes: child6).
	self assert: (parent children includes: child2).
	self assert: (parent children includes: child5).
	self assert: parent children size equals: 2.
	self assert: (child1 userData at: #pyramidRemovedAtIndex) equals: 1.
	self assert: (child3 userData at: #pyramidRemovedAtIndex) equals: 3.
	self assert: (child4 userData at: #pyramidRemovedAtIndex) equals: 4.
	self assert: (child6 userData at: #pyramidRemovedAtIndex) equals: 6.

	"Undo"
	history undo.
	self assert: (parent children includes: child1).
	self assert: (parent children includes: child2).
	self assert: (parent children includes: child3).
	self assert: (parent children includes: child4).
	self assert: (parent children includes: child5).
	self assert: (parent children includes: child6).
	self assert: parent children size equals: 6.
	self assert: (parent children indexOf: child1) equals: 1.
	self assert: (parent children indexOf: child2) equals: 2.
	self assert: (parent children indexOf: child3) equals: 3.
	self assert: (parent children indexOf: child4) equals: 4.
	self assert: (parent children indexOf: child5) equals: 5.
	self assert: (parent children indexOf: child6) equals: 6.
	self deny: (child1 userData includesKey: #pyramidRemovedAtIndex).
	self deny: (child3 userData includesKey: #pyramidRemovedAtIndex).
	self deny: (child4 userData includesKey: #pyramidRemovedAtIndex).
	self deny: (child6 userData includesKey: #pyramidRemovedAtIndex).

	"Redo"
	history redo.
	self deny: (parent children includes: child1).
	self deny: (parent children includes: child3).
	self deny: (parent children includes: child4).
	self deny: (parent children includes: child6).
	self assert: (parent children includes: child2).
	self assert: (parent children includes: child5).
	self assert: parent children size equals: 2.
	self assert: (child1 userData at: #pyramidRemovedAtIndex) equals: 1.
	self assert: (child3 userData at: #pyramidRemovedAtIndex) equals: 3.
	self assert: (child4 userData at: #pyramidRemovedAtIndex) equals: 4.
	self assert: (child6 userData at: #pyramidRemovedAtIndex) equals: 6.

	"Undo"
	history undo.
	self assert: (parent children includes: child1).
	self assert: (parent children includes: child2).
	self assert: (parent children includes: child3).
	self assert: (parent children includes: child4).
	self assert: (parent children includes: child5).
	self assert: (parent children includes: child6).
	self assert: parent children size equals: 6.
	self assert: (parent children indexOf: child1) equals: 1.
	self assert: (parent children indexOf: child2) equals: 2.
	self assert: (parent children indexOf: child3) equals: 3.
	self assert: (parent children indexOf: child4) equals: 4.
	self assert: (parent children indexOf: child5) equals: 5.
	self assert: (parent children indexOf: child6) equals: 6.
	self deny: (child1 userData includesKey: #pyramidRemovedAtIndex).
	self deny: (child3 userData includesKey: #pyramidRemovedAtIndex).
	self deny: (child4 userData includesKey: #pyramidRemovedAtIndex).
	self deny: (child6 userData includesKey: #pyramidRemovedAtIndex).
]
