Class {
	#name : #PyramidRemoveSelectionCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommandTest >> arrayNoRoots [

	| items parents elements selection roots |
	items := self parentsAndElements.
	parents := items key.
	elements := items value.

	selection := elements at: 3.
	roots := {  }.


	^ {
		  selection.
		  roots.
		  parents }
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommandTest >> arrayWithParents [

	| items parents elements selection roots |
	items := self parentsAndElements.
	parents := items key.
	elements := items value.

	selection := parents last.
	roots := OrderedCollection new
		         add: elements first;
		         add: elements last;
					add: parents last;
		         yourself.


	^ {
		  selection.
		  roots.
		  parents }
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommandTest >> arrayWithRoots [

	| items parents elements selection roots |
	items := self parentsAndElements.
	parents := items key.
	elements := items value.

	selection := elements at: 3.
	roots := OrderedCollection new
		         add: elements first;
		         add: elements last;
		         yourself.


	^ {
		  selection.
		  roots.
		  parents }
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommandTest >> arraysToTest [

	^ { self arrayNoRoots . self arrayWithParents . self arrayWithRoots }
]

{ #category : #accessing }
PyramidRemoveSelectionCommandTest >> command [

	^ PyramidRemoveSelectionCommand new
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommandTest >> parentsAndElements [

	| p1 p2 p3 e1 e2 e3 e4 e5 e6 parents elements |
	p1 := BlElement new.
	p2 := BlElement new.
	p3 := BlElement new.
	
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.
	e5 := BlElement new.
	e6 := BlElement new.

	p1 addChild: e1.
	p2 addChild: e2.
	p2 addChild: e3.
	p3 addChild: e4.
	p3 addChild: e5.
	p3 addChild: e6.

	parents := {
		           p1.
		           p2.
		           p3 }.
	elements := {
		            e1.
		            e2.
		            e3.
		            e4.
		            e5.
		            e6 }.

	^ parents -> elements
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommandTest >> targetsCanBeUsedFor [

	^ {
		  BlElement new.
		  (BlElement new
			   addChild: BlElement new;
			   yourself) }
]

{ #category : #tests }
PyramidRemoveSelectionCommandTest >> testGetValueFor [

	self targetsCanBeUsedFor do: [ :each |
		self assert: (self command getValueFor: each ) equals: nil ]
]

{ #category : #tests }
PyramidRemoveSelectionCommandTest >> testHistory [
	"Do once.
	undo
	redo
	undo
	redo"

	| array history commandExecutor targets parents roots result |
	array := self arrayWithParents.
	targets := { (array at: 1) }.
	roots := array at: 2.
	parents := array at: 3.
	history := PyramidHistory new.
	commandExecutor := PyramidHistoryCommandExecutor new
		                   history: history;
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself.

	"Do once"
	result := false.
	parents do: [ :parent |
		result := result | (parent children includesAny: targets) ].
	result := result | (roots includesAny: targets).
	self assert: result.
	commandExecutor use: self command on: targets with: (array at: 2).
	parents do: [ :parent |
		self deny: (parent children includesAny: targets) ].
	self deny: (roots includesAny: targets).



	"Undo all"
	targets reverseDo: [ :argument |
		history canUndo ifTrue: [ history undo ] ].
	result := false.
	parents do: [ :parent |
		result := result | (parent children includesAny: targets) ].
	result := result | (roots includesAny: targets).
	self assert: result.

	"Redo all"
	targets do: [ :target | history canRedo ifTrue: [ history redo ] ].
	parents do: [ :parent |
		self deny: (parent children includesAny: targets) ].
	self deny: (roots includesAny: targets).

	"Undo all"
	targets do: [ :target | history canUndo ifTrue: [ history undo ] ].
	result := false.
	parents do: [ :parent |
		result := result | (parent children includesAny: targets) ].
	result := result | (roots includesAny: targets).
	self assert: result.

	"Redo all"
	targets do: [ :target | history canRedo ifTrue: [ history redo ] ].
	parents do: [ :parent |
		self deny: (parent children includesAny: targets) ].
	self deny: (roots includesAny: targets)
]

{ #category : #tests }
PyramidRemoveSelectionCommandTest >> testSetValueForWith [

	|selection roots parents|
	self arraysToTest do: [ :array |
	selection := array at: 1.
	roots := array at: 2.
	parents := array at: 3.
	self command setValueFor: selection with: roots.
	parents do: [ :parent | self deny: (parent children includes: selection) ].
	self deny: (roots includes: selection). ]
	
]
