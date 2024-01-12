Class {
	#name : #PyramidAutomaticCommandTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-command'
}

{ #category : #tests }
PyramidAutomaticCommandTest >> testCanBeUsedFor [

	| obj1 obj2 command |
	obj1 := PyramidMockObjectForTest new.
	obj2 := Object new.
	command := PyramidAutomaticCommand new validationBlock: [:e | e isKindOf: PyramidMockObjectForTest].
	self
		assert: (command canBeUsedFor: obj1).
self
		deny: (command canBeUsedFor: obj2).
]
