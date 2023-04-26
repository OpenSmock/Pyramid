Class {
	#name : #PyramidSerializerTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #tests }
PyramidSerializerTest >> testMethodToCompileWithRoots [
	"Test:
	
	initialize with default value.
	Verify string equals correct value."

	| serializer selector roots result |
	selector := #test.
	roots := { 'hello' . 'world'}.
	serializer := PyramidSerializer new.

	self should: [result := serializer methodToCompile: selector withRoots: roots] raise: PyramidSerializerError .

	serializer serializeBlock: [ :roots | Character space join: roots ].
	result := serializer methodToCompile: selector withRoots: roots.
	self assert: result equals: 'test

	^ ''hello world'''.
	
	serializer comment: 'This is a comment.'.
	result := serializer methodToCompile: selector withRoots: roots.
	self assert: result equals: 'test
	"This is a comment."

	^ ''hello world'''.

	serializer pragmaName: 'Testing'.
	result := serializer methodToCompile: selector withRoots: roots.
	self assert: result equals: 'test
	"This is a comment."

	<Testing>
	^ ''hello world'''
]
