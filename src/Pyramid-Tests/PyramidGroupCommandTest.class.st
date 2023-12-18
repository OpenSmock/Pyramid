Class {
	#name : #PyramidGroupCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidGroupCommandTest >> command [

	^ PyramidGroupCommand new
]

{ #category : #'as yet unclassified' }
PyramidGroupCommandTest >> targetsCanBeUsedFor [

	| parent elements |
	parent := BlElement new.
	elements := { BlElement new. BlElement new . BlElement new }.
	parent addChildren: elements.
	
	^ { { BlElement new. BlElement new . BlElement new. BlElement new } . elements }
]

{ #category : #'as yet unclassified' }
PyramidGroupCommandTest >> targetsCannotBeUsedFor [
	| parent elements |
	parent := BlElement new.
	elements := {
		            BlElement new.
		            BlElement new.
		            BlElement new }.
	parent addChildren: elements.

	^ {
		  {  }.
		  (elements asOrderedCollection add: BlElement new; yourself) }
]

{ #category : #tests }
PyramidGroupCommandTest >> testGetValueFor [

	self targetsCanBeUsedFor do: [ :each |
		self assert: (self command getValueFor: each) equals: nil ]
]

{ #category : #tests }
PyramidGroupCommandTest >> testHistory [
	"Do once.
	undo
	redo
	undo
	redo"

	| history commandExecutor e1 e2 e3 e4 selection roots |
	history := PyramidHistory new.
	commandExecutor := PyramidHistoryCommandExecutor new
		                   history: history;
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself.

	"parent is not nil. elements are roots."
	e1 := BlElement new id: #parent.
	e2 := BlElement new id: #e2.
	e3 := BlElement new id: #e3.
	e4 := BlElement new id: #e4.

	selection := {
		             e2.
		             e3.
		             e4 }.
	e1 addChildren: selection.
	roots := OrderedCollection new.
	roots addAll: selection.

	self assert: (roots includesAll: selection).
	self assert: (selection allSatisfy: [ :each | each parent = e1 ]).

	"Do once"
	commandExecutor use: self command on: { selection } with: roots.
	self deny: (roots includesAny: selection).
	self deny: (selection anySatisfy: [ :each | each parent = e1 ]).

	"Undo all"
	history undo.
	self assert: (roots includesAll: selection).
	self assert: (selection allSatisfy: [ :each | each parent = e1 ]).

	"Redo all"
	history redo.
	self deny: (roots includesAny: selection).
	self deny: (selection anySatisfy: [ :each | each parent = e1 ]).

	"Undo all"
	history undo.
	self assert: (roots includesAll: selection).
	self assert: (selection allSatisfy: [ :each | each parent = e1 ]).

	"Redo all"
	history redo.
	self deny: (roots includesAny: selection).
	self deny: (selection anySatisfy: [ :each | each parent = e1 ])
]

{ #category : #tests }
PyramidGroupCommandTest >> testSetValueForWith [

	| e1 e2 e3 e4 selection roots parent |
	"parent is nil. elements are not roots. Order is not important because element are not display so it doesn't really make sense to test the order of the group command."
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.

	selection := {
		             e1.
		             e2.
		             e3.
		             e4 }.
	roots := OrderedCollection new.

	selection do: [ :each | self assert: each parent equals: nil ].
	self command setValueFor: selection with: roots.
	parent := selection first parent.
	self assert: parent isNotNil.
	self assert: parent childrenCount equals: 4.
	selection do: [ :each | self assert: each parent equals: parent ].


	"parent is not nil. elements are not roots. Order in parent is not the same as in selection. The group should keep the parent order."
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.

	selection := {
		             e2.
		             e3.
		             e4 }.
	e1 addChildren: {
			e4.
			e3.
			e2 }.
	roots := OrderedCollection new.

	selection do: [ :each | self assert: each parent equals: e1 ].
	self command setValueFor: selection with: roots.
	parent := selection first parent.
	self deny: parent equals: e1.
	selection do: [ :each | self assert: each parent equals: parent ].
	"We test the order on new parent."
	self assert: parent childrenCount equals: 3.
	self assert: parent children first equals: e4.
	self assert: parent children second equals: e3.
	self assert: parent children last equals: e2.


	"parent is nil. elements are roots. Order is not important because element are not display so it doesn't really make sense to test the order of the group command."
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.

	selection := {
		             e1.
		             e2.
		             e3.
		             e4 }.
	roots := OrderedCollection new.
	roots addAll: selection.

	self assert: (roots includesAll: selection).
	selection do: [ :each | self assert: each parent equals: nil ].
	self command setValueFor: selection with: roots.
	parent := selection first parent.
	self assert: parent isNotNil.
	self assert: parent childrenCount equals: 4.
	selection do: [ :each | self assert: each parent equals: parent ].
	self deny: (roots includesAny: selection).
	self assert: (roots includes: parent).


	"parent is not nil. elements are roots. Selection is not in correct order."
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.

	selection := {
		             e2.
		             e3.
		             e4 }.
	"e1 contains the same element as selection but not in the same order. Group should put them in order according to e1 children order."
	e1 addChildren: {
			e4.
			e3.
			e2 }.
	"roots is selection."
	roots := OrderedCollection new.
	roots addAll: selection.

	"We check the setup for the test is ok."
	self assert: (roots includesAll: selection).
	selection do: [ :each | self assert: each parent equals: e1 ].
	"We execute the command."
	self command setValueFor: selection with: roots.
	"We check parent is not e1 and all elements have the same new parent. and new parent is in root."
	parent := selection first parent.
	self deny: parent equals: e1.
	selection do: [ :each | self assert: each parent equals: parent ].
	self deny: (roots includesAny: selection).
	self assert: (roots includes: parent).
	"We check if the new parent contains the 3 elements in the correct order."
	self assert: parent childrenCount equals: 3.
	self assert: parent children first equals: e4.
	self assert: parent children second equals: e3.
	self assert: parent children last equals: e2.


	"parent is nil. elements are not roots. element are not 0@0"
	e1 := BlElement new
		      position: 40 @ 40;
		      yourself.
	e2 := BlElement new
		      position: 60 @ 60;
		      yourself.
	e3 := BlElement new
		      position: 70 @ 70;
		      yourself.
	e4 := BlElement new
		      position: 100 @ 100;
		      yourself.

	selection := {
		             e1.
		             e2.
		             e3.
		             e4 }.
	roots := OrderedCollection new.

	selection do: [ :each | self assert: each parent equals: nil ].
	self command setValueFor: selection with: roots.
	parent := selection first parent.
	self assert: parent isNotNil.
	self assert: parent childrenCount equals: 4.
	self assert: parent constraints position equals: 40 @ 40.
	self assert: e1 constraints position equals: 0 @ 0.
	self assert: e2 constraints position equals: 20 @ 20.
	self assert: e3 constraints position equals: 30 @ 30.
	self assert: e4 constraints position equals: 60 @ 60.
	selection do: [ :each | self assert: each parent equals: parent ]
]
