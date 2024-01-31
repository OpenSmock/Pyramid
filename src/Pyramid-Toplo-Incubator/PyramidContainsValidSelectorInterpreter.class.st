Class {
	#name : #PyramidContainsValidSelectorInterpreter,
	#superclass : #ToElementSelectorVisitor,
	#instVars : [
		'theme',
		'targetStack',
		'result'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #operating }
PyramidContainsValidSelectorInterpreter >> check: aSelector on: anElement [

	targetStack := Stack new.
	self push: anElement.
	result := true.
	aSelector accept: self.
	^ result
]

{ #category : #initialization }
PyramidContainsValidSelectorInterpreter >> initialize [

	super initialize.
	result := true
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> pop [

	^ targetStack pop
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> push: anElement [

	self themeDo: [ :th |
		anElement skinManagerDo: [ :sm | sm setUp: anElement forTheme: th ] ].
	targetStack push: anElement
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> result [

	^ result
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> theme [

	^ theme
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> theme: aTheme [

	theme := aTheme
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> themeDo: aBlock [

	self theme ifNil: [ ^ self ].
	aBlock value: self theme
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreter >> top [

	^ targetStack top
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitActionSelector: aSelector [

	result := aSelector action value: self top
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitAndSelector: aSelector [

	aSelector left accept: self.
	result ifFalse: [ ^ self ].
	aSelector right accept: self.
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitChildSelector: aSelector [

	| parent |
	aSelector left accept: self.
	result ifFalse: [ ^ self ].

	result := false.
	parent := self top.
	"evaluate only for children at a given depth or at any depth if selector depth is not specified "
	parent allChildrenBreadthFirstWithDepthDo: [ :child :depth |
		(aSelector depth isNil or: [ aSelector depth = depth ]) ifTrue: [
			self push: child.
			aSelector right accept: self.
			self pop.
			result ifTrue: [ ^ self ] ] ]
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitIdSelector: aSelector [

	result := aSelector id = self top id
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitNotSelector: aSelector [
	"
	If left accept: self = true -> uncertain.
	If left accept: self = true && left contains id = true -> false.
	If left accept: self = true && left contains id = false -> true.
	If left accept: self = false -> true.
	"

	aSelector left accept: self.
	result ifFalse: [ result := true ]
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitOrSelector: aSelector [

	aSelector left accept: self.
	result ifTrue: [ ^ self ].
	aSelector right accept: self.
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitParentSelector: aSelector [

	| current depth |
	aSelector left accept: self.
	result ifFalse: [ ^ self ].

	result := true.
	current := self top.
	depth := aSelector depth.

	[
	current := current parent.
	current ifNil: [ ^ self ].
	depth ifNotNil: [
		depth := depth - 1.
		depth < 0 ifTrue: [ ^ self ] ].
	(depth isNil or: [ depth isZero ]) ifTrue: [
		self push: current.
		aSelector right accept: self.
		self pop.
		(depth notNil or: [ result ]) ifTrue: [ ^ self ] ] ] repeat
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitSiblingSelector: aSelector [

	| current |
	aSelector left accept: self.
	result ifFalse: [ ^ self ].

	result := true.
	current := self top.
	current siblingsDo: [ :sib |
		self push: sib.
		aSelector right accept: self.
		self pop.
		"Condition at least one sibling."
		result ifTrue: [ ^ self ] ]
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitStyleStampSelector: aSelector [
"Do nothing"
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitTypeSelector: aSelector [

	result := (aSelector selectType: self top class)
]

{ #category : #visiting }
PyramidContainsValidSelectorInterpreter >> visitUniversalSelector: aSelector [
"Do nothing"
]
