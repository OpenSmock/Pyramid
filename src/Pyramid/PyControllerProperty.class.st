Class {
	#name : #PyControllerProperty,
	#superclass : #Object,
	#traits : 'TPySelectionObserver',
	#classTraits : 'TPySelectionObserver classTrait',
	#instVars : [
		'pipeline',
		'view',
		'command'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyControllerProperty >> applyValue: aValue [

	self applyValue: aValue to: self selection
]

{ #category : #'as yet unclassified' }
PyControllerProperty >> applyValue: aValue to: aPySelection [

	self pipeline selection: aPySelection.
	self pipeline useCommand: (command arguments: aValue).
	self selection notifyObservers
]

{ #category : #accessing }
PyControllerProperty >> command [

	^ command
]

{ #category : #accessing }
PyControllerProperty >> command: aCommand [

	command := aCommand
]

{ #category : #'as yet unclassified' }
PyControllerProperty >> formAllDifferentsValues [
	
^ (self selection elements collect: [ :each |
		              self valueFromElement: each ]) asSet asArray.
]

{ #category : #'as yet unclassified' }
PyControllerProperty >> formSingleValue [
	^ self formAllDifferentsValues first
]

{ #category : #accessing }
PyControllerProperty >> initialize [

	command := PyCommandVoid new.
]

{ #category : #accessing }
PyControllerProperty >> pipeline [

	pipeline ifNil: [ pipeline := PyPipeline new add: PyCommandExecutor new; yourself].
	^ pipeline
]

{ #category : #accessing }
PyControllerProperty >> pipeline: aPipeline [

	pipeline := aPipeline
]

{ #category : #'as yet unclassified' }
PyControllerProperty >> pySelectionChanged [

	self selectionIsEmpty ifTrue: [
		self strategy: PyPropertyStrategySelectionEmpty new.
		^ self ].
	self selectionIsSingle ifTrue: [
		self strategy:
			(PyPropertyStrategySelectionSingle new valueOfForm:
				 self formSingleValue).
		^ self ].
	self selectionIsMixed ifTrue: [
		self strategy: PyPropertyStrategySelectionMixed new.
		^ self ].
	self strategy: (PyPropertyStrategySelectionMultiple new valueOfForm:
				 self formSingleValue)
]

{ #category : #accessing }
PyControllerProperty >> selection: aSelection [

	self selection removeObserver: self.
	selection := aSelection.
	selection addObserver: self.
	
	self pySelectionChanged
]

{ #category : #'as yet unclassified' }
PyControllerProperty >> selectionIsEmpty [

	^ self selection isEmpty
]

{ #category : #'as yet unclassified' }
PyControllerProperty >> selectionIsMixed [

	^ (self formAllDifferentsValues size = 1) not
]

{ #category : #'as yet unclassified' }
PyControllerProperty >> selectionIsSingle [

	^ self selection size = 1
]

{ #category : #accessing }
PyControllerProperty >> strategy: aStrategy [

	aStrategy updateView: self view
]

{ #category : #'as yet unclassified' }
PyControllerProperty >> valueFromElement: anElement [

	| arg |
	arg := PyCommandArguments new.
	self command stateOf: anElement for: arg.
	^ arg value
]

{ #category : #accessing }
PyControllerProperty >> view [

	^ view
]

{ #category : #accessing }
PyControllerProperty >> view: aPyViewProperty [

	view := aPyViewProperty
]
