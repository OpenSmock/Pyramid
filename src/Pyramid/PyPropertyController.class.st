Class {
	#name : #PyPropertyController,
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
PyPropertyController >> applyValue: aValue [

	self applyValue: aValue to: self selection
]

{ #category : #'as yet unclassified' }
PyPropertyController >> applyValue: aValue to: aPySelection [

	self pipeline selection: aPySelection.
	self pipeline useCommand: (command arguments: aValue).
	self pySelectionChanged
]

{ #category : #accessing }
PyPropertyController >> command [

	^ command
]

{ #category : #accessing }
PyPropertyController >> command: aCommand [

	command := aCommand
]

{ #category : #'as yet unclassified' }
PyPropertyController >> formAllDifferentsValues [
	
^ (self selection elements collect: [ :each |
		              self valueFromElement: each ]) asSet asArray.
]

{ #category : #'as yet unclassified' }
PyPropertyController >> formSingleValue [
	^ self formAllDifferentsValues first
]

{ #category : #accessing }
PyPropertyController >> initialize [

	command := PyCommandVoid new.
]

{ #category : #accessing }
PyPropertyController >> pipeline [

	pipeline ifNil: [ pipeline := PyPipeline new add: PyCommandExecutor new; yourself].
	^ pipeline
]

{ #category : #accessing }
PyPropertyController >> pipeline: aPipeline [

	pipeline := aPipeline
]

{ #category : #'as yet unclassified' }
PyPropertyController >> pySelectionChanged [

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

{ #category : #'as yet unclassified' }
PyPropertyController >> selectionIsEmpty [

	^ self selection isEmpty
]

{ #category : #'as yet unclassified' }
PyPropertyController >> selectionIsMixed [

	^ self formAllDifferentsValues size ~= 1
]

{ #category : #'as yet unclassified' }
PyPropertyController >> selectionIsSingle [

	^ self selection size = 1
]

{ #category : #accessing }
PyPropertyController >> strategy: aStrategy [

	aStrategy updateView: self view
]

{ #category : #'as yet unclassified' }
PyPropertyController >> valueFromElement: anElement [

	| arg |
	arg := PyCommandArguments new.
	self command stateOf: anElement for: arg.
	^ arg value
]

{ #category : #accessing }
PyPropertyController >> view [

	^ view
]

{ #category : #accessing }
PyPropertyController >> view: aPyViewProperty [

	view := aPyViewProperty
]
