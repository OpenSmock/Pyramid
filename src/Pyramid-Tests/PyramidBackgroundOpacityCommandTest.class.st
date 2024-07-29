Class {
	#name : #PyramidBackgroundOpacityCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBackgroundOpacityCommandTest >> command [

	^ PyramidBackgroundOpacityCommand new
]

{ #category : #testing }
PyramidBackgroundOpacityCommandTest >> isBlBackgroundEqualityFix [

	| e b1 b2 |
	b1 := (BlBackground paint: Color red) opacity: 0.4.
	b2 := (BlBackground paint: Color red) opacity: 0.2.
	e := BlElement new
		     id: #e1;
		     background: b1;
		     yourself.
	e background: b2.
	^ e background == b2
]

{ #category : #'as yet unclassified' }
PyramidBackgroundOpacityCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    id: #e3;
					    background: Color red)
			   with: (BlElement new
					    id: #e1;
					    background: ((BlBackground paint: Color red) opacity: 0.4);
					    yourself)
			   prop: 0.4).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    id: #e4;
					    background: ((BlBackground paint: Color red) opacity: 0.5);
					    yourself)
			   with: (BlElement new
					    id: #e2;
					    background: ((BlBackground paint: Color red) opacity: 0.3);
					    yourself)
			   prop: 0.3) }
]

{ #category : #tests }
PyramidBackgroundOpacityCommandTest >> testHistory [
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

	self isBlBackgroundEqualityFix ifFalse: [ ^ self skip. ].

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
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: argument ] ].

	"Undo all"
	self argumentsForHistory reverseDo: [ :argument |
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: argument ].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self assert: (self command getValueFor: target) equals: argument ] ]
]

{ #category : #tests }
PyramidBackgroundOpacityCommandTest >> testSetValueForWith [

	self isBlBackgroundEqualityFix ifFalse: [ ^ self skip. ].

	self targetsWithoutValuesAndValues do: [ :each |
		self command setValueFor: each key with: each value.
		self assert: (self command getValueFor: each key) equals: each value ]
]
