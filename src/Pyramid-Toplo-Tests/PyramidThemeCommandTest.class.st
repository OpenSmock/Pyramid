Class {
	#name : 'PyramidThemeCommandTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : 'Pyramid-Toplo-Tests-cases-plugin-theme-management',
	#package : 'Pyramid-Toplo-Tests',
	#tag : 'cases-plugin-theme-management'
}

{ #category : 'accessing' }
PyramidThemeCommandTest >> command [

	^ PyramidThemeCommand new
]

{ #category : 'as yet unclassified' }
PyramidThemeCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    toTheme: ToRawTheme new;
					    yourself)
			   prop: ToRawTheme new).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    toTheme: ToRawDarkTheme new;
					    yourself)
			   with: (BlElement new
					    toTheme: ToRawTheme new;
					    yourself)
			   prop: ToRawTheme new).
			 (PyramidCommandTestContainer
			   no: (BlElement new
					    toTheme: ToRawDarkTheme new;
					    yourself)
			   with: (BlElement new)
			   prop: nil) }
]

{ #category : 'tests' }
PyramidThemeCommandTest >> testGetValueFor [

	self targetsWithValuesAndValues do: [ :each |
		self assert: (self command getValueFor: each key) class equals: each value class ].
]

{ #category : 'tests' }
PyramidThemeCommandTest >> testHistory [
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
