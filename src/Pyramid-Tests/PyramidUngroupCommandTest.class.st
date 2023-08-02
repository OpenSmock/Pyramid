Class {
	#name : #PyramidUngroupCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidUngroupCommandTest >> command [

	^ PyramidUngroupCommand new
]

{ #category : #'as yet unclassified' }
PyramidUngroupCommandTest >> targetsCanBeUsedFor [

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
PyramidUngroupCommandTest >> targetsCannotBeUsedFor [

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
PyramidUngroupCommandTest >> testGetValueFor [

	self targetsCanBeUsedFor do: [ :each |
		self assert: (self command getValueFor: each) equals: nil ]
]

{ #category : #tests }
PyramidUngroupCommandTest >> testHistory [
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
PyramidUngroupCommandTest >> testSetValueForWith [

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
	self assert: (roots includesAll: selection)
]
