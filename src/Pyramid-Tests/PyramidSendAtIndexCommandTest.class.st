Class {
	#name : #PyramidSendAtIndexCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-siblings'
}

{ #category : #accessing }
PyramidSendAtIndexCommandTest >> command [

	^ PyramidSendAtIndexCommand new
]

{ #category : #'as yet unclassified' }
PyramidSendAtIndexCommandTest >> targetContainers [

	| parent1 a1 a2 a3 a4 b1 b2 b3 b4 parent2 |
	parent1 := BlElement new
		           id: #parent1;
		           yourself.
	a1 := BlElement new
		      id: #a1;
		      zIndex: 0;
		      yourself.
	a2 := BlElement new
		      id: #a2;
		      zIndex: 2;
		      yourself.
	a3 := BlElement new
		      id: #a3;
		      zIndex: 3;
		      yourself.
	a4 := BlElement new
		      id: #a4;
		      zIndex: 4;
		      yourself.
	parent1 addChildren: {
			a1.
			a2.
			a3.
			a4 }.
	
	parent2 := BlElement new
		           id: #parent2;
		           yourself.
	b1 := BlElement new
		      id: #b1;
		      zIndex: 40;
		      yourself.
	b2 := BlElement new
		      id: #b2;
		      zIndex: 42;
		      yourself.
	b3 := BlElement new
		      id: #b3;
		      zIndex: 43;
		      yourself.
	b4 := BlElement new
		      id: #b4;
		      zIndex: 44;
		      yourself.
	parent2 addChildren: {
			b1.
			b3.
			b2.
			b4 }.

	^ {
		  (PyramidCommandTestContainer
			   no: b1
			   with: a1
			   prop: (PyramidChangePositionWithSiblingsModel new
					    childIndex: 1;
					    zIndex: 0)).
		  (PyramidCommandTestContainer
			   no: b2
			   with: a2
			   prop: (PyramidChangePositionWithSiblingsModel new
					    childIndex: 2;
					    zIndex: 2)).
		  (PyramidCommandTestContainer
			   no: b3
			   with: a3
			   prop: (PyramidChangePositionWithSiblingsModel new
					    childIndex: 3;
					    zIndex: 3)).
		  (PyramidCommandTestContainer
			   no: b4
			   with: a4
			   prop: (PyramidChangePositionWithSiblingsModel new
					    childIndex: 4;
					    zIndex: 4)) }
]

{ #category : #'as yet unclassified' }
PyramidSendAtIndexCommandTest >> targetsCannotBeUsedFor [
	"override if needed"

	^ {
		  nil.
		  false.
		  0.
		  $a.
		  BlElement new }
]
