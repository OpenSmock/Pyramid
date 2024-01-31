Class {
	#name : #PyramidSelectorContainsInvalidTypeInterpreter,
	#superclass : #ToElementSelectorVisitor,
	#instVars : [
		'theme',
		'targetStack',
		'result'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #operating }
PyramidSelectorContainsInvalidTypeInterpreter >> check: aSelector on: anElement [

	targetStack := Stack new.
	self push: anElement.
	result := true.
	aSelector accept: self.
	^ result
]

{ #category : #initialization }
PyramidSelectorContainsInvalidTypeInterpreter >> initialize [ 

	super initialize.
	result := false
]

{ #category : #accessing }
PyramidSelectorContainsInvalidTypeInterpreter >> pop [

	^ targetStack pop
]

{ #category : #accessing }
PyramidSelectorContainsInvalidTypeInterpreter >> push: anElement [

	self themeDo: [ :th |
		anElement skinManagerDo: [ :sm | sm setUp: anElement forTheme: th ] ].
	targetStack push: anElement
]

{ #category : #accessing }
PyramidSelectorContainsInvalidTypeInterpreter >> result [

	^ result
]

{ #category : #accessing }
PyramidSelectorContainsInvalidTypeInterpreter >> theme [

	^ theme
]

{ #category : #accessing }
PyramidSelectorContainsInvalidTypeInterpreter >> theme: aTheme [

	theme := aTheme
]

{ #category : #accessing }
PyramidSelectorContainsInvalidTypeInterpreter >> themeDo: aBlock [

	self theme ifNil: [ ^ self ].
	aBlock value: self theme
]

{ #category : #accessing }
PyramidSelectorContainsInvalidTypeInterpreter >> top [

	^ targetStack top
]

{ #category : #visiting }
PyramidSelectorContainsInvalidTypeInterpreter >> visitActionSelector: aSelector [

	result := aSelector action value: self top
]

{ #category : #visiting }
PyramidSelectorContainsInvalidTypeInterpreter >> visitAndSelector: aSelector [

	aSelector left accept: self.
	result ifFalse: [ ^ self ].
	aSelector right accept: self.
]

{ #category : #visiting }
PyramidSelectorContainsInvalidTypeInterpreter >> visitChildSelector: aSelector [

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
PyramidSelectorContainsInvalidTypeInterpreter >> visitIdSelector: aSelector [

	result := aSelector id = self top id
]

{ #category : #visiting }
PyramidSelectorContainsInvalidTypeInterpreter >> visitNotSelector: aSelector [

	self flag: #TODO.
	aSelector left accept: self.
	"result := result not"
]

{ #category : #visiting }
PyramidSelectorContainsInvalidTypeInterpreter >> visitOrSelector: aSelector [

	aSelector left accept: self.
	result ifTrue: [ ^ self ].
	aSelector right accept: self.
]

{ #category : #visiting }
PyramidSelectorContainsInvalidTypeInterpreter >> visitParentSelector: aSelector [

	| current depth |
	aSelector left accept: self.
	result ifFalse: [ ^ self ].

	result := false.
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
PyramidSelectorContainsInvalidTypeInterpreter >> visitSiblingSelector: aSelector [

	| current |
	aSelector left accept: self.
	result ifFalse: [ ^ self ].

	result := false.
	current := self top.
	current siblingsDo: [ :sib |
		self push: sib.
		aSelector right accept: self.
		self pop.
		result ifTrue: [ ^ self ] ]
]

{ #category : #visiting }
PyramidSelectorContainsInvalidTypeInterpreter >> visitStyleStampSelector: aSelector [

	result := true
]

{ #category : #visiting }
PyramidSelectorContainsInvalidTypeInterpreter >> visitTypeSelector: aSelector [

	result := (aSelector selectType: self top class)
]

{ #category : #visiting }
PyramidSelectorContainsInvalidTypeInterpreter >> visitUniversalSelector: aSelector [

	result := true
]
