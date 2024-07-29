Class {
	#name : #PyramidMoveBackwardOrderCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-order'
}

{ #category : #'as yet unclassified' }
PyramidMoveBackwardOrderCommandTest >> argumentsForHistory [

	^ { 3. 2. 1 }
]

{ #category : #accessing }
PyramidMoveBackwardOrderCommandTest >> command [

	^ PyramidMoveBackwardOrderCommand new
]

{ #category : #'as yet unclassified' }
PyramidMoveBackwardOrderCommandTest >> makeElementWithChildren [

	| parent c1 c2 c3 |
	parent := BlElement new id: #parent; yourself.
	c1 := BlElement new id: #c1; yourself.
	c2 := BlElement new id: #c2; yourself.
	c3 := BlElement new id: #c3; yourself.
	parent addChildren: { c1. c2 . c3 }.
	^ parent
]

{ #category : #'as yet unclassified' }
PyramidMoveBackwardOrderCommandTest >> targetContainers [

	| test1 test2 test3 |
	test1 := self makeElementWithChildren.
	test2 := self makeElementWithChildren.
	test3 := self makeElementWithChildren.

	^ {
		  (PyramidCommandTestContainer
			   no: (test1 childAt: 1)
			   with: 1
			   prop: 1).
		  (PyramidCommandTestContainer
			   no: (test2 childAt: 2)
			   with: 1
			   prop: 2).
		  (PyramidCommandTestContainer
			   no: (test3 childAt: 3)
			   with: 2
			   prop: 3) }
]

{ #category : #'as yet unclassified' }
PyramidMoveBackwardOrderCommandTest >> targetsCanBeUsedFor [

	^ self targetContainers flatCollect: [ :each |
		  {
			  each targetNoProp } ]
]

{ #category : #'as yet unclassified' }
PyramidMoveBackwardOrderCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	^ { nil. false. 0. $a . BlElement new }
]

{ #category : #accessing }
PyramidMoveBackwardOrderCommandTest >> targetsWithValuesAndValues [

	^ self targetContainers collect: [ :each |
		  each targetNoProp -> each prop ]
]

{ #category : #accessing }
PyramidMoveBackwardOrderCommandTest >> targetsWithoutValuesAndValues [

	^ self targetContainers collect: [ :each |
		  each targetNoProp -> each targetWithProp ]
]

{ #category : #tests }
PyramidMoveBackwardOrderCommandTest >> testHistory [
	"Do once.
	undo
	redo
	undo
	redo"

	| history commandExecutor targets parent |
	parent := self makeElementWithChildren.
	targets := { (parent childAt: 3) }.
	history := PyramidHistory new.
	commandExecutor := PyramidHistoryCommandExecutor new
		                   history: history;
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself.

	"Do once"
	self argumentsForHistory do: [ :each |
		commandExecutor use: self command on: targets with: each ].

	"Undo all"
	self argumentsForHistory reverseDo: [ :argument |
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: argument ].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: argument ].
		history canRedo ifTrue: [ history redo ] ].

	"Undo all"
	self argumentsForHistory reverseDo: [ :argument |
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: argument ].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: argument ].
		history canRedo ifTrue: [ history redo ] ]
]
