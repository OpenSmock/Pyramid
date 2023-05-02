Class {
	#name : #PyramidCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'testModels'
	],
	#category : #'NeoPyramid-Tests-Cases'
}

{ #category : #running }
PyramidCommandTest >> setUp [

	super setUp.

]

{ #category : #tests }
PyramidCommandTest >> testAddChildren [

	| e1 e2 e3 b1 b2 b3 state |
	state := PyramidCommandState new.

	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e1 addChildren: {
			e2.
			e3 }.

	PyramidCommand addChildren getState: state from: e1.

	self assert: state arguments size equals: 2.
	self assert: state arguments first equals: e2.
	self assert: state arguments last equals: e3.



	b1 := BlElement new.
	b2 := BlElement new.
	b3 := BlElement new.

	PyramidCommand addChildren
		setState: (PyramidCommandState new arguments: {
					 b2.
					 b3 })
		on: b1.
	self assert: b1 children size equals: 2.
	b1 children indexOf: b2 ifAbsent: [ self fail ].
	b1 children indexOf: b3 ifAbsent: [ self fail ]
]

{ #category : #tests }
PyramidCommandTest >> testAddElementOnCollection [

	| e1 e2 e3 b1 b2 b3 state |
	state := PyramidCommandState new.

	e1 := PyramidObservableElementCollection new.
	e2 := BlElement new.
	e3 := BlElement new.
	e1 addAll: {
			e2.
			e3 }.

	PyramidCommand addElementOnCollection getState: state from: e1.

	self assert: state arguments size equals: 2.
	self assert: state arguments first equals: e2.
	self assert: state arguments last equals: e3.



	b1 := PyramidObservableElementCollection new.
	b2 := BlElement new.
	b3 := BlElement new.

	PyramidCommand addElementOnCollection
		setState: (PyramidCommandState new arguments: {
					 b2.
					 b3 })
		on: b1.
	self assert: b1 elements size equals: 2.
	b1 elements indexOf: b2 ifAbsent: [ self fail ].
	b1 elements indexOf: b3 ifAbsent: [ self fail ]
]

{ #category : #tests }
PyramidCommandTest >> testIdentifier [

	| e1 b1 state |
	state := PyramidCommandState new.
	e1 := BlElement new.
	PyramidCommand identifier getState: state from: e1.
	self assert: state arguments equals: nil.
	e1 id: #toto.
	PyramidCommand identifier getState: state from: e1.
	self assert: state arguments equals: #toto.

	b1 := BlElement new.
	PyramidCommand identifier
		setState: (PyramidCommandState new arguments: #test)
		on: b1.
	self assert: b1 id asSymbol equals: #test.

]

{ #category : #tests }
PyramidCommandTest >> testRemoveChildren [

	| e1 e2 e3 b1 b2 b3 state |
	state := PyramidCommandState new.

	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e1 addChildren: {
			e2.
			e3 }.

	PyramidCommand removeChildren getState: state from: e1.

	self assert: state arguments size equals: 2.
	self assert: state arguments first equals: e2.
	self assert: state arguments last equals: e3.

	b1 := BlElement new.
	b2 := BlElement new.
	b3 := BlElement new.
	b1 addChildren: {
			b2.
			b3 }.

	PyramidCommand removeChildren
		setState: (PyramidCommandState new arguments: {
					 b2 })
		on: b1.
	self assert: b1 children size equals: 1.
	self assert: (b1 children indexOf: b2) equals: 0.
	b1 children indexOf: b3 ifAbsent: [ self fail ]
]

{ #category : #tests }
PyramidCommandTest >> testRemoveElementOnCollection [

	| e1 e2 e3 b1 b2 b3 state |
	state := PyramidCommandState new.

	e1 := PyramidObservableElementCollection new.
	e2 := BlElement new.
	e3 := BlElement new.
	e1 addAll: {
			e2.
			e3 }.

	PyramidCommand removeElementOnCollection getState: state from: e1.

	self assert: state arguments size equals: 2.
	self assert: state arguments first equals: e2.
	self assert: state arguments last equals: e3.

	b1 := PyramidObservableElementCollection new.
	b2 := BlElement new.
	b3 := BlElement new.
	b1 addAll: {
			b2.
			b3 }.

	PyramidCommand removeElementOnCollection
		setState: (PyramidCommandState new arguments: { b2 })
		on: b1.
	self assert: b1 elements size equals: 1.
	self assert: (b1 elements indexOf: b2) equals: 0.
	b1 elements indexOf: b3 ifAbsent: [ self fail ]
]

{ #category : #tests }
PyramidCommandTest >> testVisibility [

	| e1 b1 state |
	state := PyramidCommandState new.
	e1 := BlElement new.
	PyramidCommand visibility getState: state from: e1.
	self assert: state arguments isVisible.
	self deny: state arguments isHidden.
	self deny: state arguments isGone.

	e1 visibility: BlVisibility hidden.
	PyramidCommand visibility getState: state from: e1.
	self deny: state arguments isVisible.
	self assert: state arguments isHidden.
	self deny: state arguments isGone.
	
	e1 visibility: BlVisibility gone.
	PyramidCommand visibility getState: state from: e1.
	self deny: state arguments isVisible.
	self assert: state arguments isHidden.
	self assert: state arguments isGone.

	b1 := BlElement new.
	PyramidCommand visibility
		setState: (PyramidCommandState new arguments: BlVisibility gone)
		on: b1.
	self deny: b1 visibility isVisible.
	self assert: b1 visibility isHidden.
	self assert: b1 visibility isGone.
	
b1 := BlElement new.
	PyramidCommand visibility
		setState: (PyramidCommandState new arguments: BlVisibility hidden)
		on: b1.
	self deny: b1 visibility isVisible.
	self assert: b1 visibility isHidden.
	self deny: b1 visibility isGone.
	
b1 := BlElement new.
	PyramidCommand visibility
		setState: (PyramidCommandState new arguments: BlVisibility visible)
		on: b1.
	self assert: b1 visibility isVisible.
	self deny: b1 visibility isHidden.
	self deny: b1 visibility isGone.
]
