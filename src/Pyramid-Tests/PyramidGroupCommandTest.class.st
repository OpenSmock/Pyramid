Class {
	#name : #PyramidGroupCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-group'
}

{ #category : #tests }
PyramidGroupCommandTest >> assertBeforeSetValuefor: selection parent: originalParent firstLevel: firstLevelElements elements: aCollection [
	"children have the same parent (originalParent)."

	self assert:
		(selection allSatisfy: [ :e | e parent = originalParent ]).

	"children order is correct"
	self
		assert: originalParent children first
		equals: (aCollection at: 1).
	self
		assert: originalParent children second
		equals: (aCollection at: 2).
	self
		assert: originalParent children third
		equals: (aCollection at: 3).

	"firstLevelElements does have all selection"
	self assert: (selection allSatisfy: [ :target |
			 firstLevelElements includes: target ]).
	self assert: firstLevelElements size equals: 4.

	"original parent does have selection as children."
	self assert: (selection allSatisfy: [ :target |
			 originalParent children includes: target ]).

	"children position"
	self
		assert: (aCollection at: 1) constraints position
		equals: 10 asPoint.
	self
		assert: (aCollection at: 2) constraints position
		equals: 20 asPoint.
	self
		assert: (aCollection at: 3) constraints position
		equals: 30 asPoint
]

{ #category : #tests }
PyramidGroupCommandTest >> assertSetValuefor: selection parent: originalParent firstLevel: firstLevelElements elements: aCollection [

	| group |
	"children have the same parent (group) element."
	group := selection first parent.
	self assert: (selection allSatisfy: [ :e | e parent = group ]).

	"children order is correct"
	self assert: group children first equals: (aCollection at: 1).
	self assert: group children second equals: (aCollection at: 2).
	self assert: group children third equals: (aCollection at: 3).

	"original parent has group as child"
	self assert: (originalParent hasChild: group).

	"firstLevelElements do not have selection"
	self deny: (firstLevelElements anySatisfy: [ :target |
			 selection includes: target ]).

	"firstLevelElements includes groupElement"
	self assert: (firstLevelElements includes: group).
	self assert: firstLevelElements size equals: 2.

	"original parent does not have selection as children."
	self deny: (originalParent children anySatisfy: [ :target |
			 selection includes: target ]).

	"group and children position"
	self assert: group constraints position equals: 10 asPoint.
	self
		assert: (aCollection at: 1) constraints position
		equals: 0 asPoint.
	self
		assert: (aCollection at: 2) constraints position
		equals: 10 asPoint.
	self
		assert: (aCollection at: 3) constraints position
		equals: 20 asPoint
]

{ #category : #accessing }
PyramidGroupCommandTest >> command [

	^ PyramidGroupCommand new
]

{ #category : #'as yet unclassified' }
PyramidGroupCommandTest >> makeParentTestCase [

	| parent e1 e2 e3 e4 |
	parent := BlElement new
		          id: #parent;
		          yourself.
	e1 := BlElement new
		      id: #e1;
				position: 10 asPoint;
		      yourself.
	e2 := BlElement new
		      id: #e2;
		position: 20 asPoint;
		      yourself.
	e3 := BlElement new
		      id: #e3;
		position: 30 asPoint;
		      yourself.
	e4 := BlElement new
		      id: #e4;
		position: 40 asPoint;
		      yourself.
	parent addChildren: {
			e1.
			e2.
			e3.
			e4 }.
	^ parent
]

{ #category : #tests }
PyramidGroupCommandTest >> testCanBeUsedFor [

	| originalParent selection e1 e2 e3 |
	originalParent := self makeParentTestCase.
	e1 := originalParent children first.
	e2 := originalParent children second.
	e3 := originalParent children third.
	selection := {
		             e3.
		             e2.
		             e1 }.
	self assert: (self command canBeUsedFor: selection).
	self targetsCannotBeUsedFor do: [ :each |
		self deny: (self command canBeUsedFor: each) ]
]

{ #category : #tests }
PyramidGroupCommandTest >> testGetValueFor [

	| originalParent selection e1 e2 e3 |
	originalParent := self makeParentTestCase.
	e1 := originalParent children first.
	e2 := originalParent children second.
	e3 := originalParent children third.
	selection := {
		             e3.
		             e2.
		             e1 }.

	self assert: (self command getValueFor: selection) equals: nil
]

{ #category : #tests }
PyramidGroupCommandTest >> testHistory [
	"Do once.
	undo
	redo
	undo
	redo"

	| history commandExecutor originalParent selection firstLevelElements e1 e2 e3 |
	originalParent := self makeParentTestCase.
	e1 := originalParent children first.
	e2 := originalParent children second.
	e3 := originalParent children third.
	selection := {
		             e3.
		             e2.
		             e1 }.
	firstLevelElements := {
		                      e1.
		                      e2.
		                      e3.
		                      BlElement new } asOrderedCollection.

	history := PyramidHistory new.
	commandExecutor := PyramidHistoryCommandExecutor new
		                   history: history;
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself.

	"Do once"
	commandExecutor
		use: self command
		on: { selection }
		with: firstLevelElements.
	self
		assertSetValuefor: selection
		parent: originalParent
		firstLevel: firstLevelElements
		elements: {
				e1.
				e2.
				e3 }.

	"Undo all"
	history undo.
	self
		assertBeforeSetValuefor: selection
		parent: originalParent
		firstLevel: firstLevelElements
		elements: {
				e1.
				e2.
				e3 }.

	"Redo all"
	history redo.
	self
		assertSetValuefor: selection
		parent: originalParent
		firstLevel: firstLevelElements
		elements: {
				e1.
				e2.
				e3 }.

	"Undo all"
	history undo.
	self
		assertBeforeSetValuefor: selection
		parent: originalParent
		firstLevel: firstLevelElements
		elements: {
				e1.
				e2.
				e3 }.

	"Redo all"
	history redo.
	self
		assertSetValuefor: selection
		parent: originalParent
		firstLevel: firstLevelElements
		elements: {
				e1.
				e2.
				e3 }
]

{ #category : #tests }
PyramidGroupCommandTest >> testSetValueForWith [

	| originalParent selection firstLevelElements e1 e2 e3 |
	originalParent := self makeParentTestCase.
	e1 := originalParent children first.
	e2 := originalParent children second.
	e3 := originalParent children third.
	selection := {
		             e3.
		             e2.
		             e1 }.
	firstLevelElements := {
		                      e1.
		                      e2.
		                      e3.
		                      BlElement new } asOrderedCollection.
		
	self
		assertBeforeSetValuefor: selection
		parent: originalParent
		firstLevel: firstLevelElements
		elements: {
				e1.
				e2.
				e3 }.
		
	"Command execution."
	self command setValueFor: selection with: firstLevelElements.

	self
		assertSetValuefor: selection
		parent: originalParent
		firstLevel: firstLevelElements
		elements: {
				e1.
				e2.
				e3 }
]
