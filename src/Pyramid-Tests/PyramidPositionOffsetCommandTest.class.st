Class {
	#name : 'PyramidPositionOffsetCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-bloc'
}

{ #category : 'accessing' }
PyramidPositionOffsetCommandTest >> command [

	^ PyramidPositionOffsetCommand new
]

{ #category : 'as yet unclassified' }
PyramidPositionOffsetCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    position: 50 @ 50;
					    yourself)
			   prop: 50 @ 50).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    position: 50 @ 50;
					    yourself)
			   with: (BlElement new
					    position: 100 @ 100;
					    yourself)
			   prop: 50 @ 50) }
]

{ #category : 'accessing' }
PyramidPositionOffsetCommandTest >> targetsWithValuesAndValues [

	^ self targetContainers collect: [ :each |
		  each targetWithProp -> each targetWithProp constraints position ]
]

{ #category : 'tests' }
PyramidPositionOffsetCommandTest >> testHistory [
	"Do once.
	undo
	redo
	undo
	redo"

	| history commandExecutor targets initialValue |
	targets := {
		           BlElement new.
		           BlElement new.
		           BlElement new }.
	initialValue := 0 @ 0.
	history := PyramidHistory new.
	commandExecutor := PyramidHistoryCommandExecutor new
		                   history: history;
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself.

	"Do once"
	self argumentsForHistory do: [ :each |
		commandExecutor use: self command on: targets with: each.
		initialValue := initialValue + each ].

	"Undo all"
	self argumentsForHistory reverseDo: [ :argument |
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: initialValue ].
		initialValue := initialValue - argument.
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		initialValue := initialValue + argument.
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: initialValue ] ].

	"Undo all"
	self argumentsForHistory reverseDo: [ :argument |
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: initialValue ].
		initialValue := initialValue - argument.
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		initialValue := initialValue + argument.
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: initialValue ] ]
]

{ #category : 'tests' }
PyramidPositionOffsetCommandTest >> testSetValueForWith [

	self targetsWithoutValuesAndValues do: [ :each |
		| initialValue |
		initialValue := self command getValueFor: each key.
		self command setValueFor: each key with: each value.
		self assert: (self command getValueFor: each key) equals: each value + initialValue ]
]
