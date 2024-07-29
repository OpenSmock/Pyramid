Class {
	#name : #PyramidAddChildCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidAddChildCommandTest >> command [

	^ PyramidAddChildCommand new
]

{ #category : #'as yet unclassified' }
PyramidAddChildCommandTest >> targetsCanBeUsedFor [

	^ { BlElement new . BlElement new addChild: BlElement new; yourself }
]

{ #category : #accessing }
PyramidAddChildCommandTest >> targetsWithoutValuesAndValues [

	^ self targetsCanBeUsedFor collect: [ :each | each -> (BlElement new background: Color random; yourself) ]
]

{ #category : #tests }
PyramidAddChildCommandTest >> testGetValueFor [
	"ignore get return nothing"

	self targetsCanBeUsedFor do: [ :each | self assert: (self command getValueFor: each) equals: nil ]
	
]

{ #category : #tests }
PyramidAddChildCommandTest >> testHistory [
	"Do once.
	undo
	redo
	undo
	redo"

	| history commandExecutor targets e0 e1 e2 e3 argumentsForHistory |
	e0 := BlElement new
		      id: #e0;
		      yourself.
	e1 := BlElement new
		      id: #e1;
		      yourself.
	e2 := BlElement new
		      id: #e2;
		      yourself.
	e3 := BlElement new
		      id: #e3;
		      yourself.

	argumentsForHistory := {
		  e0.
		  e1.
		  e2.
		  e3 }.
	targets := { BlElement new }.
	history := PyramidHistory new.
	commandExecutor := PyramidHistoryCommandExecutor new
		                   history: history;
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself.

	"Do once"
	argumentsForHistory do: [ :each |
		commandExecutor use: self command on: targets with: each ].

	"Undo all"
	argumentsForHistory reverseDo: [ :argument |
		targets do: [ :target |
			self assert: (target children includes: argument) ].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	argumentsForHistory do: [ :argument |
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self assert: (target children includes: argument) ] ].

	"Undo all"
	argumentsForHistory reverseDo: [ :argument |
		targets do: [ :target |
			self assert: (target children includes: argument) ].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	argumentsForHistory do: [ :argument |
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self assert: (target children includes: argument) ] ]
]

{ #category : #tests }
PyramidAddChildCommandTest >> testSetValueForWith [

	self targetsWithoutValuesAndValues do: [ :each |
		self command setValueFor: each key with: each value.
		self assert: (each key children includes:each value)  ]
]
