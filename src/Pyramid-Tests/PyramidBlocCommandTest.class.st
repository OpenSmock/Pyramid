Class {
	#name : #PyramidBlocCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'testModels'
	],
	#category : #'Pyramid-Tests-Cases'
}

{ #category : #running }
PyramidBlocCommandTest >> setUp [

	super setUp.

]

{ #category : #tests }
PyramidBlocCommandTest >> testAddChildren [

	| e1 e2 e3 b1 b2 b3 state |
	state := PyramidCommandState new.

	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e1 addChildren: {
			e2.
			e3 }.

	PyramidBlocCommand addChildren getState: state from: e1.

	self assert: state arguments size equals: 2.
	self assert: state arguments first equals: e2.
	self assert: state arguments last equals: e3.



	b1 := BlElement new.
	b2 := BlElement new.
	b3 := BlElement new.

	PyramidBlocCommand addChildren
		setState: (PyramidCommandState new arguments: {
					 b2.
					 b3 })
		on: b1.
	self assert: b1 children size equals: 2.
	b1 children indexOf: b2 ifAbsent: [ self fail ].
	b1 children indexOf: b3 ifAbsent: [ self fail ]
]

{ #category : #tests }
PyramidBlocCommandTest >> testAddElementOnCollection [

	| e1 e2 e3 b1 b2 b3 state |
	state := PyramidCommandState new.

	e1 := PyramidCollectionWithCallbacks new.
	e2 := BlElement new.
	e3 := BlElement new.
	e1 addAll: {
			e2.
			e3 }.

	PyramidBlocCommand addElementOnCollection getState: state from: e1.

	self assert: state arguments size equals: 2.
	self assert: state arguments first equals: e2.
	self assert: state arguments last equals: e3.



	b1 := PyramidCollectionWithCallbacks new.
	b2 := BlElement new.
	b3 := BlElement new.

	PyramidBlocCommand addElementOnCollection
		setState: (PyramidCommandState new arguments: {
					 b2.
					 b3 })
		on: b1.
	self assert: b1 collection size equals: 2.
	b1 collection indexOf: b2 ifAbsent: [ self fail ].
	b1 collection indexOf: b3 ifAbsent: [ self fail ]
]

{ #category : #tests }
PyramidBlocCommandTest >> testBackground [

	| e1 b1 state |
	state := PyramidCommandState new.
	e1 := BlElement new
		      geometry: (BlRoundedRectangleGeometry cornerRadius: 17);
		      yourself.
	PyramidBlocCommand geometry getState: state from: e1.
	self assert: state arguments class equals: BlRoundedRectangleGeometry.
	self assert: state arguments cornerRadii equals: (BlCornerRadii radius: 17).

	b1 := BlElement new.
	PyramidBlocCommand geometry
		setState: (PyramidCommandState new arguments: BlEllipseGeometry new)
		on: b1.
	self assert: b1 geometry class equals: BlEllipseGeometry
]

{ #category : #tests }
PyramidBlocCommandTest >> testConstraints [

	| e1 b1 state |
	state := PyramidCommandState new.
	e1 := BlElement new constraintsDo: [ :c | c horizontal matchParent. c vertical exact: 50 ].
	PyramidBlocCommand constraints getState: state from: e1.
	self assert: state arguments vertical resizer isExact.
	self assert: state arguments vertical resizer size equals: 50.
	self assert: state arguments horizontal resizer isMatchParent.

	b1 := BlElement new.
	PyramidBlocCommand constraints
		setState: (PyramidCommandState new arguments: [ :c | c vertical fitContent. c horizontal matchParent])
		on: b1.
	self assert: b1 constraints vertical resizer isFitContent.
	self assert: b1 constraints horizontal resizer isMatchParent.
]

{ #category : #tests }
PyramidBlocCommandTest >> testIdentifier [

	| e1 b1 state |
	state := PyramidCommandState new.
	e1 := BlElement new.
	PyramidBlocCommand identifier getState: state from: e1.
	self assert: state arguments equals: nil.
	e1 id: #toto.
	PyramidBlocCommand identifier getState: state from: e1.
	self assert: state arguments equals: #toto.

	b1 := BlElement new.
	PyramidBlocCommand identifier
		setState: (PyramidCommandState new arguments: #test)
		on: b1.
	self assert: b1 id asSymbol equals: #test.

]

{ #category : #tests }
PyramidBlocCommandTest >> testPosition [

	| e1 b1 state |
	state := PyramidCommandState new.
	e1 := BlElement new position: 10 @ 10.
	PyramidBlocCommand position getState: state from: e1.
	self assert: state arguments equals: 10 @ 10.
	e1 position: 20 @ 20.
	PyramidBlocCommand position getState: state from: e1.
	self assert: state arguments equals: 20 @ 20.

	b1 := BlElement new.
	PyramidBlocCommand position
		setState: (PyramidCommandState new arguments: 30 @ 30)
		on: b1.
	self assert: b1 constraints position equals: 30 @ 30
]

{ #category : #tests }
PyramidBlocCommandTest >> testRemoveChildren [

	| e1 e2 e3 b1 b2 b3 state |
	state := PyramidCommandState new.

	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	e1 addChildren: {
			e2.
			e3 }.

	PyramidBlocCommand removeChildren getState: state from: e1.

	self assert: state arguments size equals: 2.
	self assert: state arguments first equals: e2.
	self assert: state arguments last equals: e3.

	b1 := BlElement new.
	b2 := BlElement new.
	b3 := BlElement new.
	b1 addChildren: {
			b2.
			b3 }.

	PyramidBlocCommand removeChildren
		setState: (PyramidCommandState new arguments: {
					 b2 })
		on: b1.
	self assert: b1 children size equals: 1.
	self assert: (b1 children indexOf: b2) equals: 0.
	b1 children indexOf: b3 ifAbsent: [ self fail ]
]

{ #category : #tests }
PyramidBlocCommandTest >> testRemoveElementOnCollection [

	| e1 e2 e3 b1 b2 b3 state |
	state := PyramidCommandState new.

	e1 := PyramidCollectionWithCallbacks new.
	e2 := BlElement new.
	e3 := BlElement new.
	e1 addAll: {
			e2.
			e3 }.

	PyramidBlocCommand removeElementOnCollection getState: state from: e1.

	self assert: state arguments size equals: 2.
	self assert: state arguments first equals: e2.
	self assert: state arguments last equals: e3.

	b1 := PyramidCollectionWithCallbacks new.
	b2 := BlElement new.
	b3 := BlElement new.
	b1 addAll: {
			b2.
			b3 }.

	PyramidBlocCommand removeElementOnCollection
		setState: (PyramidCommandState new arguments: { b2 })
		on: b1.
	self assert: b1 collection size equals: 1.
	self assert: (b1 collection indexOf: b2) equals: 0.
	b1 collection indexOf: b3 ifAbsent: [ self fail ]
]

{ #category : #tests }
PyramidBlocCommandTest >> testText [

	| e1 b1 state |
	state := PyramidCommandState new.
	e1 := 'abcde' asRopedText
		      fontSize: 36;
		      asElement.
	PyramidBlocCommand text getState: state from: e1.
	self assert: state arguments asString equals: 'abcde'.

	b1 := '123' asRopedText
		      fontSize: 36;
		      asElement.
	PyramidBlocCommand text
		setState: (PyramidCommandState new arguments: '456789' asRopedText)
		on: b1.
	self assert: b1 text asString equals: '456789'.
	self assert: (b1 text hasAttribute: (BlFontSizeAttribute size: 36))
]

{ #category : #tests }
PyramidBlocCommandTest >> testTextAttribute [

	| e1 b1 state |
	state := PyramidCommandState new.
	e1 := 'abcde' asRopedText
		      fontSize: 36;
		      bold;
		      asElement.
	PyramidBlocCommand textAttribute getState: state from: e1.
	self assert: state arguments size equals: 2.
	self assert: (state arguments anySatisfy: [ :each |( each isKindOf: BlFontSizeAttribute) and: [ each equals: (BlFontSizeAttribute size: 36)]  ]).
	self assert: (state arguments anySatisfy: [ :each | ( each isKindOf: BlFontWeightAttribute) and: [each equals: (BlFontWeightAttribute bold)]  ]).

	b1 := '123' asRopedText
		      fontSize: 36;
		      asElement.
	PyramidBlocCommand textAttribute
		setState: (PyramidCommandState new arguments: (BlFontWeightAttribute thin))
		on: b1.
	self assert: (b1 text attributesFinder hasAttributeSuchThat: [ :each |( each isKindOf: BlFontSizeAttribute) and: [ each equals: (BlFontSizeAttribute size: 36)]  ]).
	self assert: (b1 text attributesFinder hasAttributeSuchThat: [ :each | ( each isKindOf: BlFontWeightAttribute) and: [each equals: (BlFontWeightAttribute thin)]  ]).
]

{ #category : #tests }
PyramidBlocCommandTest >> testVisibility [

	| e1 b1 state |
	state := PyramidCommandState new.
	e1 := BlElement new.
	PyramidBlocCommand visibility getState: state from: e1.
	self assert: state arguments isVisible.
	self deny: state arguments isHidden.
	self deny: state arguments isGone.

	e1 visibility: BlVisibility hidden.
	PyramidBlocCommand visibility getState: state from: e1.
	self deny: state arguments isVisible.
	self assert: state arguments isHidden.
	self deny: state arguments isGone.
	
	e1 visibility: BlVisibility gone.
	PyramidBlocCommand visibility getState: state from: e1.
	self deny: state arguments isVisible.
	self assert: state arguments isHidden.
	self assert: state arguments isGone.

	b1 := BlElement new.
	PyramidBlocCommand visibility
		setState: (PyramidCommandState new arguments: BlVisibility gone)
		on: b1.
	self deny: b1 visibility isVisible.
	self assert: b1 visibility isHidden.
	self assert: b1 visibility isGone.
	
b1 := BlElement new.
	PyramidBlocCommand visibility
		setState: (PyramidCommandState new arguments: BlVisibility hidden)
		on: b1.
	self deny: b1 visibility isVisible.
	self assert: b1 visibility isHidden.
	self deny: b1 visibility isGone.
	
b1 := BlElement new.
	PyramidBlocCommand visibility
		setState: (PyramidCommandState new arguments: BlVisibility visible)
		on: b1.
	self assert: b1 visibility isVisible.
	self deny: b1 visibility isHidden.
	self deny: b1 visibility isGone.
]
