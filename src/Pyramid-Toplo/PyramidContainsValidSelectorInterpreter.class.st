Class {
	#name : #PyramidContainsValidSelectorInterpreter,
	#superclass : #ToElementSelectorVisitor,
	#instVars : [
		'targetElement',
		'validSelectors',
		'invalidSelectors',
		'ignoredSelectors'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #operating }
PyramidContainsValidSelectorInterpreter >> check: aSelector on: anElement [

	targetElement := anElement.
	validSelectors := OrderedCollection new.
	invalidSelectors := OrderedCollection new.
	ignoredSelectors := OrderedCollection new.
	aSelector accept: self.
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> ignoredSelectors [

	^ ignoredSelectors
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> invalidSelectors [

	^ invalidSelectors
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> result [

	invalidSelectors ifNil: [ ^ false ].
	^ invalidSelectors isEmpty
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> targetElement [

	
	^ targetElement
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> validSelectors [

	^ validSelectors
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitActionSelector: aSelector [

	(aSelector action value: self targetElement)
		ifTrue: [ self validSelectors add: aSelector ]
		ifFalse: [ self invalidSelectors add: aSelector ]
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitAndSelector: aSelector [

	| interpreterForAndLeft interpreterForAndRight |
	interpreterForAndLeft := self class new.
	interpreterForAndLeft check: aSelector left on: self targetElement.

	interpreterForAndLeft result ifFalse: [
		self invalidSelectors add: self.
		^ self ].

	interpreterForAndRight := self class new.
	interpreterForAndRight check: aSelector right on: self targetElement.

	interpreterForAndRight result ifFalse: [
		self invalidSelectors add: self.
		^ self ].

	self validSelectors add: aSelector.
	self ignoredSelectors addAll: interpreterForAndLeft ignoredSelectors.
	self ignoredSelectors addAll: interpreterForAndRight ignoredSelectors
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitChildSelector: aSelector [

	| parent interpreterForLeft interpreterForRight |
	interpreterForLeft := self class new.
	interpreterForRight := ToSelectorInterpreter new.
	interpreterForLeft check: aSelector left on: self targetElement.

	interpreterForLeft result ifFalse: [
		self invalidSelectors add: aSelector.
		^ self ].

	parent := self targetElement.
	"evaluate only for children at a given depth or at any depth if selector depth is not specified "
	parent allChildrenBreadthFirstWithDepthDo: [ :child :depth |
		(aSelector depth isNil or: [ aSelector depth = depth ]) ifTrue: [
			interpreterForRight check: aSelector right on: child.
			interpreterForRight result ifTrue: [
				self validSelectors add: aSelector.
				self ignoredSelectors add: interpreterForLeft ignoredSelectors.
				^ self ] ] ].
	self invalidSelectors add: aSelector
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitIdSelector: aSelector [

	aSelector id = self targetElement id
		ifTrue: [ self validSelectors add: aSelector ]
		ifFalse: [ self invalidSelectors add: aSelector ]
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitNotSelector: aSelector [

	| interpreterForNot |
	interpreterForNot := self class new.
	interpreterForNot check: aSelector left on: self targetElement.
	self invalidSelectors addAll: interpreterForNot validSelectors.
	self validSelectors addAll: interpreterForNot invalidSelectors.
	self ignoredSelectors addAll: interpreterForNot ignoredSelectors
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitOrSelector: aSelector [

	| interpreterForOrLeft interpreterForOrRight |
	interpreterForOrLeft := self class new.
	interpreterForOrLeft check: aSelector left on: self targetElement.

	interpreterForOrRight := self class new.
	interpreterForOrRight check: aSelector right on: self targetElement.

	"Both KO"
	(interpreterForOrLeft result not and: [
		 interpreterForOrRight result not ]) ifTrue: [
		self invalidSelectors add: self.
		^ self ].

	interpreterForOrLeft result ifTrue: [
		self ignoredSelectors addAll: interpreterForOrLeft ignoredSelectors ].
	interpreterForOrRight result ifTrue: [
		self ignoredSelectors addAll: interpreterForOrRight ignoredSelectors ].
	self validSelectors add: aSelector
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitParentSelector: aSelector [

	| depth current interpreterForLeft interpreterForRight |
	interpreterForLeft := self class new.
	interpreterForRight := ToSelectorInterpreter new.
	interpreterForLeft check: aSelector left on: self targetElement.

	interpreterForLeft result ifFalse: [
		self invalidSelectors add: aSelector.
		^ self ].

	current := self targetElement.
	depth := aSelector depth.

	[
	current := current parent.
	current ifNil: [
		self invalidSelectors add: aSelector.
		^ self ].
	depth ifNotNil: [
		depth := depth - 1.
		depth < 0 ifTrue: [
			self invalidSelectors add: aSelector.
			^ self ] ].
	(depth isNil or: [ depth isZero ]) ifTrue: [
		interpreterForRight check: aSelector right on: current.
		(interpreterForRight result) ifTrue: [
			self validSelectors add: aSelector.
			self ignoredSelectors addAll: interpreterForLeft ignoredSelectors.
			^ self ] ] ] repeat
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitSiblingSelector: aSelector [

	| current interpreterForSiblingLeft interpreterForSiblingRight |
	interpreterForSiblingLeft := self class new.
	interpreterForSiblingRight := ToSelectorInterpreter new.
	interpreterForSiblingLeft
		check: aSelector left
		on: self targetElement.

	interpreterForSiblingLeft result ifFalse: [
		self invalidSelectors add: aSelector.
		^ self ].

	current := self targetElement.
	current siblingsDo: [ :sib |
		interpreterForSiblingRight check: aSelector right on: sib.
		interpreterForSiblingRight result ifTrue: [
			self validSelectors add: aSelector.
			self ignoredSelectors addAll:
				interpreterForSiblingLeft ignoredSelectors.
			"There is no interest to add the right ignored items since they are sibling dependant"
			^ self ] ].
	self invalidSelectors add: aSelector
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitStyleStampSelector: aSelector [
	self ignoredSelectors add: aSelector
	
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitTypeSelector: aSelector [

	(aSelector selectType: self targetElement class)
		ifTrue: [ self validSelectors add: aSelector ]
		ifFalse: [ self invalidSelectors add: aSelector ]
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitUniversalSelector: aSelector [

	"Must be valid for not"
	self validSelectors add: aSelector
]
