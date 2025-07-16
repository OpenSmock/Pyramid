Class {
	#name : #PyramidLayoutBlocCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidLayoutBlocCommandTest >> command [

	^ PyramidLayoutBlocCommand new
]

{ #category : #'as yet unclassified' }
PyramidLayoutBlocCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    layout: BlFlowLayout vertical;
					    yourself)
			   prop: BlFlowLayout vertical).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    layout: BlFlowLayout vertical;
					    yourself)
			   with: (BlElement new
					    layout: BlBasicLayout new;
					    yourself)
			   prop: BlBasicLayout new).
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    layout: BlProportionalLayout new;
					    yourself)
			   prop: BlProportionalLayout new) }
]

{ #category : #tests }
PyramidLayoutBlocCommandTest >> testGetValueFor [

	self targetsWithValuesAndValues do: [ :each |
		self assert: (self command getValueFor: each key) class equals: each value class ].
]

{ #category : #tests }
PyramidLayoutBlocCommandTest >> testHistory [
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
				assert: (self command getValueFor: target) class
				equals: argument class ].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self assert: (self command getValueFor: target) class equals: argument class ] ].

	"Undo all"
	self argumentsForHistory reverseDo: [ :argument |
		targets do: [ :target |
			self assert: (self command getValueFor: target) class equals: argument class ].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self assert: (self command getValueFor: target) class equals: argument class ] ]
]
