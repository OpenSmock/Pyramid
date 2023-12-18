Class {
	#name : #PyramidGroupInverseCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidGroupInverseCommandTest >> command [

	^ PyramidGroupInverseCommand new
]

{ #category : #'as yet unclassified' }
PyramidGroupInverseCommandTest >> targetsCanBeUsedFor [

	| parent elements |
	parent := BlElement new.
	elements := {
		            BlElement new.
		            BlElement new.
		            BlElement new }.
	parent addChildren: elements.

	^ {
		  elements }
]

{ #category : #'as yet unclassified' }
PyramidGroupInverseCommandTest >> targetsCannotBeUsedFor [

	| parent elements |
	parent := BlElement new.
	elements := {
		            BlElement new.
		            BlElement new.
		            BlElement new }.
	parent addChildren: elements.

	^ {
		  {  }.
		  {
			  BlElement new.
			  BlElement new.
			  BlElement new.
			  BlElement new }.
		  (elements asOrderedCollection
			   add: BlElement new;
			   yourself) }
]

{ #category : #tests }
PyramidGroupInverseCommandTest >> testGetValueFor [

	self targetsCanBeUsedFor do: [ :each |
		self assert: (self command getValueFor: each) equals: nil ]
]

{ #category : #tests }
PyramidGroupInverseCommandTest >> testHistory [
	"Do once.
	undo
	redo
	undo
	redo"

	| history commandExecutor e1 e2 e3 e4 selection roots parent |
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
	roots add: e1.

	self assert: (roots includes: selection first parent).
	self deny: (roots includesAny: selection).
	self assert: (selection allSatisfy: [ :each | each parent = e1 ]).

	"Do once"
	commandExecutor use: self command on: { selection } with: roots.
	self assert: (roots includesAll: selection).
	self deny: (selection anySatisfy: [ :each | each parent = e1 ]).

	"Undo all"
	history undo.
	parent := selection first parent.
	self assert: (roots includes: selection first parent).
	self deny: (roots includesAny: selection).
	self assert: (selection allSatisfy: [ :each | each parent = parent ]).

	"Redo all"
	history redo.
	self assert: (roots includesAll: selection).
	self deny: (selection anySatisfy: [ :each | each parent = e1 ]).

	"Undo all"
	history undo.
	parent := selection first parent.
	self assert: (roots includes: selection first parent).
	self deny: (roots includesAny: selection).
	self assert: (selection allSatisfy: [ :each | each parent = parent ]).

	"Redo all"
	history redo.
	self assert: (roots includesAll: selection).
	self deny: (selection anySatisfy: [ :each | each parent = e1 ]).
]

{ #category : #tests }
PyramidGroupInverseCommandTest >> testSetValueForWith [

	| e1 e2 e3 e4 selection roots parent |
	"parent is not nil. elements are not roots."
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.

	selection := {
		             e2.
		             e3.
		             e4 }.
	e1 addChildren: selection.
	roots := OrderedCollection new.

	selection do: [ :each | self assert: each parent equals: e1 ].
	self command setValueFor: selection with: roots.
	parent := selection first parent.
	self deny: parent equals: e1.
	selection do: [ :each | self assert: each parent equals: parent ].


	"parent is not nil. elements are roots."
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.

	selection := {
		             e2.
		             e3.
		             e4 }.
	e1 addChildren: selection.
	roots := OrderedCollection new.
	roots add: e1.

	self assert: (roots includes: e1).
	self deny: (roots includesAny: selection).
	selection do: [ :each | self assert: each parent equals: e1 ].
	self command setValueFor: selection with: roots.
	parent := selection first parent.
	self deny: parent equals: e1.
	selection do: [ :each | self assert: each parent equals: parent ].
	self deny: (roots includes: e1).
	self assert: (roots includesAll: selection).

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
		             e2.
		             e3.
		             e4 }.
	e1 addChildren: selection.
	roots := OrderedCollection new.

	selection do: [ :each | self assert: each parent equals: e1 ].
	self command setValueFor: selection with: roots.
	parent := selection first parent.
	self deny: parent equals: e1.
	selection do: [ :each | self assert: each parent equals: parent ].

	self assert: e2 constraints position equals: 100 @ 100.
	self assert: e3 constraints position equals: 110 @ 110.
	self assert: e4 constraints position equals: 140 @ 140
]
