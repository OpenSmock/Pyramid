Trait {
	#name : 'TPyramidCommandTest',
	#category : 'Pyramid-Tests-cases-command',
	#package : 'Pyramid-Tests',
	#tag : 'cases-command'
}

{ #category : 'as yet unclassified' }
TPyramidCommandTest >> argumentsForHistory [


	^ self targetContainers collect: [ :each | each prop ]
]

{ #category : 'accessing' }
TPyramidCommandTest >> command [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
TPyramidCommandTest >> targetContainers [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
TPyramidCommandTest >> targetsCanBeUsedFor [

	^ self targetContainers flatCollect: [ :each | { each targetNoProp . each targetWithProp } ].
]

{ #category : 'as yet unclassified' }
TPyramidCommandTest >> targetsCannotBeUsedFor [
	"override if needed"
	^ { nil . false . 0 . $a }
]

{ #category : 'accessing' }
TPyramidCommandTest >> targetsWithValuesAndValues [

	^ self targetContainers collect: [ :each |
		  each targetWithProp -> each prop ]
]

{ #category : 'accessing' }
TPyramidCommandTest >> targetsWithoutValuesAndValues [

	^ self targetContainers collect: [ :each | each targetNoProp -> each prop ]
]

{ #category : 'tests' }
TPyramidCommandTest >> testCanBeUsedFor [

	self targetsCanBeUsedFor do: [ :each |
		self assert: (self command canBeUsedFor: each) ].
	self targetsCannotBeUsedFor do: [ :each |
		self deny: (self command canBeUsedFor: each) ].
]

{ #category : 'tests' }
TPyramidCommandTest >> testGetValueFor [

	self targetsWithValuesAndValues do: [ :each |
		self assert: (self command getValueFor: each key) equals: each value ].
]

{ #category : 'tests' }
TPyramidCommandTest >> testHistory [
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
				assert: (self command getValueFor: target)
				equals: argument ].
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

{ #category : 'tests' }
TPyramidCommandTest >> testSetValueForWith [

	self targetsWithoutValuesAndValues do: [ :each |
		self command setValueFor: each key with: each value.
		self assert: (self command getValueFor: each key) equals: each value ]
]
