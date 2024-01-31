Class {
	#name : #PyramidContainsValidSelectorInterpreter,
	#superclass : #ToElementSelectorVisitor,
	#instVars : [
		'targetStack',
		'validSelectors',
		'invalidSelectors',
		'ignoredSelectors'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #operating }
PyramidContainsValidSelectorInterpreter >> check: aSelector on: anElement [

	targetStack := Stack new.
	self push: anElement.
	validSelectors := OrderedCollection new.
	invalidSelectors := OrderedCollection new.
	ignoredSelectors := OrderedCollection new.
	aSelector accept: self.
	^ self result
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
PyramidContainsValidSelectorInterpreter >> pop [

	^ targetStack pop
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> push: anElement [

	targetStack push: anElement
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> result [

	invalidSelectors ifNil: [ ^ false ].
	^ invalidSelectors isEmpty
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> top [

	^ targetStack top
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> validSelectors [

	^ validSelectors
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitActionSelector: aSelector [
	
(aSelector action value: self top)
		ifTrue: [ self validSelectors add: aSelector ]
		ifFalse: [ self invalidSelectors add: aSelector ]
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitAndSelector: aSelector [

	aSelector left accept: self.
	self result ifFalse: [ self invalidSelectors add: self. ^ self ].
	aSelector right accept: self
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitChildSelector: aSelector [

	| parent |
	aSelector left accept: self.
	self result ifFalse: [
		self invalidSelectors add: aSelector.
		^ self ].

	parent := self top.
	"evaluate only for children at a given depth or at any depth if selector depth is not specified "
	parent allChildrenBreadthFirstWithDepthDo: [ :child :depth |
		(aSelector depth isNil or: [ aSelector depth = depth ]) ifTrue: [
			self push: child.
			self invalidSelectors removeAll.
			aSelector right accept: self.
			self pop.
			self result ifTrue: [
				self validSelectors add: aSelector.
				^ self ] ] ].
	self invalidSelectors add: aSelector
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitIdSelector: aSelector [

	(aSelector id = self top id)
		ifTrue: [ self validSelectors add: aSelector ]
		ifFalse: [ self invalidSelectors add: aSelector ]
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitNotSelector: aSelector [
	"
	If left accept: self = true -> uncertain.
	If left accept: self = true && left contains id = true -> false.
	If left accept: self = true && left contains id = false -> true.
	If left accept: self = false -> true.
	"

	| interpreterForNot |
	interpreterForNot := self class new.
	interpreterForNot check: aSelector left on: self top.
	self invalidSelectors addAll: interpreterForNot validSelectors.
	self validSelectors addAll: interpreterForNot invalidSelectors
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitOrSelector: aSelector [

	aSelector left accept: self.
	self result ifTrue: [
		self validSelectors add: aSelector.
		^ self ].
	aSelector right accept: self.
	(self invalidSelectors includes: aSelector right) ifTrue: [
		self invalidSelectors add: aSelector.
		^ self ].
	"It should be alright. we can remove all invalid."
	self invalidSelectors removeAll.
	self validSelectors add: aSelector
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitParentSelector: aSelector [

	| current depth |
	aSelector left accept: self.
	self result ifFalse: [
		self invalidSelectors add: aSelector.
		^ self ].

	current := self top.
	depth := aSelector depth.

	[
	current := current parent.
	current ifNil: [ ^ self ].
	depth ifNotNil: [
		depth := depth - 1.
		depth < 0 ifTrue: [
			self validSelectors add: aSelector.
			^ self ] ].
	(depth isNil or: [ depth isZero ]) ifTrue: [
		self invalidSelectors removeAll.
		self push: current.
		aSelector right accept: self.
		self pop.
		(depth notNil or: [ self result ]) ifTrue: [
			self validSelectors add: aSelector.
			^ self ] ] ] repeat.
	self invalidSelectors add: aSelector
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitSiblingSelector: aSelector [

	| current |
	aSelector left accept: self.
	self result ifFalse: [
		self invalidSelectors add: aSelector.
		^ self ].

	current := self top.
	current siblingsDo: [ :sib |
		self invalidSelectors removeAll.
		self push: sib.
		aSelector right accept: self.
		self pop.
		self result ifTrue: [
			self validSelectors add: aSelector.
			^ self ] ].
	self invalidSelectors add: aSelector
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitStyleStampSelector: aSelector [
	self ignoredSelectors add: aSelector
	
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitTypeSelector: aSelector [

	(aSelector selectType: self top class) ifTrue: [ self validSelectors add: aSelector ] ifFalse: [ self invalidSelectors add: aSelector ]
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitUniversalSelector: aSelector [

	self ignoredSelectors add: aSelector

	
]
