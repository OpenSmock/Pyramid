Class {
	#name : #PyramidBasicVerticalConstraintsBlocCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidBasicVerticalConstraintsBlocCommandTest >> command [

	^ PyramidBasicVerticalConstraintsBlocCommand new
]

{ #category : #'as yet unclassified' }
PyramidBasicVerticalConstraintsBlocCommandTest >> targetContainers [

	| p1 a1 b1 c1 d1 p2 a2 b2 c2 d2 |
	p1 := BlElement new
		      layout: BlBasicLayout new;
		      yourself.
	a1 := BlElement new.
	b1 := BlElement new constraintsDo: [ :c |
		      c vertical exact: 600.
		      c horizontal exact: 600 ].
	c1 := BlElement new constraintsDo: [ :c | c horizontal fitContent. c vertical fitContent ].
	d1 := BlElement new constraintsDo: [ :c | c horizontal matchParent. c vertical matchParent ].
	p1 addChildren: {
			a1.
			b1.
			c1.
			d1 }.

	p2 := BlElement new
		      layout: BlFlowLayout new;
		      yourself.
	a2 := BlElement new.
	b2 := BlElement new constraintsDo: [ :c |
		      c vertical exact: 600.
		      c horizontal exact: 600 ].
	c2 := BlElement new constraintsDo: [ :c | c horizontal fitContent. c vertical fitContent ].
	d2 := BlElement new constraintsDo: [ :c | c horizontal matchParent. c vertical matchParent ].

	p2 addChildren: {
			a2.
			b2.
			c2.
			d2 }.

	^ {
		  (PyramidCommandTestContainer no: a1 with: b1 prop: { #exact: . 600 }).
		  (PyramidCommandTestContainer no: a1 with: c1 prop: #fitContent).
		  (PyramidCommandTestContainer no: a1 with: d1 prop: #matchParent).
		   (PyramidCommandTestContainer no: a2 with: b2 prop: { #exact: . 600 }).
		  (PyramidCommandTestContainer no: a2 with: c2 prop: #fitContent).
		  (PyramidCommandTestContainer no: a2 with: d2 prop: #matchParent) }
]

{ #category : #'as yet unclassified' }
PyramidBasicVerticalConstraintsBlocCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	^ {
		  nil.
		  false.
		  0.
		  $a.
		  BlElement new.
		   }
]

{ #category : #tests }
PyramidBasicVerticalConstraintsBlocCommandTest >> testGetValueFor [

	self targetsWithValuesAndValues do: [ :each |
		self assert: (self command getValueFor: each key) asPyramidConstraintsArgument equals: each value ].
]

{ #category : #tests }
PyramidBasicVerticalConstraintsBlocCommandTest >> testHistory [
	"Do once.
	undo
	redo
	undo
	redo"

	| history commandExecutor targets |
	targets := self targetsCanBeUsedFor.
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
			self
				assert:
				(self command getValueFor: target) asPyramidConstraintsArgument
				equals: argument ].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self
				assert:
				(self command getValueFor: target) asPyramidConstraintsArgument
				equals: argument ] ].

	"Undo all"
	self argumentsForHistory reverseDo: [ :argument |
		targets do: [ :target |
			self
				assert:
				(self command getValueFor: target) asPyramidConstraintsArgument
				equals: argument ].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self
				assert:
				(self command getValueFor: target) asPyramidConstraintsArgument
				equals: argument ] ]
]

{ #category : #tests }
PyramidBasicVerticalConstraintsBlocCommandTest >> testSetValueForWith [

	self targetsWithoutValuesAndValues do: [ :each |
		self command setValueFor: each key with: each value.
		self assert: (self command getValueFor: each key) asPyramidConstraintsArgument equals: each value ]
]
