Class {
	#name : #PyramidGroupCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
PyramidGroupCommandTest >> command [

	^ PyramidGroupCommand new
]

{ #category : #'as yet unclassified' }
PyramidGroupCommandTest >> targetsCanBeUsedFor [

	| parent elements |
	parent := BlElement new.
	elements := { BlElement new. BlElement new . BlElement new }.
	parent addChildren: elements.
	
	^ { { BlElement new. BlElement new . BlElement new. BlElement new } . elements }
]

{ #category : #'as yet unclassified' }
PyramidGroupCommandTest >> targetsCannotBeUsedFor [
	| parent elements |
	parent := BlElement new.
	elements := {
		            BlElement new.
		            BlElement new.
		            BlElement new }.
	parent addChildren: elements.

	^ {
		  {  }.
		  (elements asOrderedCollection add: BlElement new; yourself) }
]

{ #category : #accessing }
PyramidGroupCommandTest >> targetsWithValuesAndValues [

	| e1 e2 e3 e4 |
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.

	^ { { e1 . e2 } -> {  } . { e3 . e4 } -> { e3 . e4 } }
]

{ #category : #tests }
PyramidGroupCommandTest >> testGetValueFor [

	self targetsCanBeUsedFor do: [ :each |
		self assert: (self command getValueFor: each) equals: nil ]
]

{ #category : #tests }
PyramidGroupCommandTest >> testSetValueForWith [

	| e1 e2 e3 e4 |
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e4 := BlElement new.

	{
		  ({
			   e1.
			   e2 } -> {  }).
		  ({
			   e3.
			   e4 } -> {
			   e3.
			   e4 }) }.

	self targetsWithoutValuesAndValues do: [ :each |
		self command setValueFor: each key with: each value ]
]
