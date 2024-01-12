Class {
	#name : #TPyramidWindowOpennableTest,
	#superclass : #TestCase,
	#instVars : [
		'window'
	],
	#category : #'Pyramid-Tests-cases-views'
}

{ #category : #running }
TPyramidWindowOpennableTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	window := PyramidTestWindow new
]

{ #category : #tests }
TPyramidWindowOpennableTest >> tearDown [

	self window close
]

{ #category : #tests }
TPyramidWindowOpennableTest >> testIsClosed [

	self assert: self window isClosed.
	self window open.
	self deny: self window isClosed.
	self window close.
	self assert: self window isClosed
]

{ #category : #tests }
TPyramidWindowOpennableTest >> testIsOpen [

	self deny: self window isOpen.
	self window open.
	self assert: self window isOpen.
	self window close.
	self deny: self window isOpen
]

{ #category : #tests }
TPyramidWindowOpennableTest >> testTitle [

	| spec |
	self window title: #hello.
	self assert: self window title equals: #hello.
	spec := self window open.
	self assert: spec title equals: #hello.

	self window title: #goodbye.
	self assert: spec title equals: #goodbye
]

{ #category : #tests }
TPyramidWindowOpennableTest >> testWhenClosedDo [

	| spec testValue |
	self window whenClosedDo: [testValue := true].

	testValue := false.
	self window open.
	self deny: testValue.
	self window close.
	self assert: testValue.

	testValue := false.
	spec := self window open.
	self deny: testValue.
	spec close.
	self assert: testValue.
	
]

{ #category : #accessing }
TPyramidWindowOpennableTest >> window [

	^ window
]
