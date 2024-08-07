Class {
	#name : #PyramidElementsManipulationHelperTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-bloc-utils'
}

{ #category : #'as yet unclassified' }
PyramidElementsManipulationHelperTest >> arrayOf3Elements [

	| e1 e2 e3|
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	
	e1 addChild: e2.
	e2 addChild: e3.
	^ { e1 . e2 . e3 }
]

{ #category : #'as yet unclassified' }
PyramidElementsManipulationHelperTest >> arrayOfElements [

"
A1 -> A2 -> A3.
B1 -> B2 -> B3.
C1 -> C2 -> C3.
D1 -> D2 -> D3.
"

	|arrayA arrayB arrayC arrayD|
	
	arrayA := self arrayOf3Elements.
	arrayB := self arrayOf3Elements.
	arrayC := self arrayOf3Elements.
	arrayD := self arrayOf3Elements.

^ { arrayA. arrayB. arrayC. arrayD }

]

{ #category : #'as yet unclassified' }
PyramidElementsManipulationHelperTest >> makeNestedElement: aNumber [

	| origin current |
	origin := current := BlElement new.
	2 to: aNumber do: [ :i |
		| temp |
		temp := BlElement new.
		current addChild: temp.
		current := temp ].
	^ origin
]

{ #category : #tests }
PyramidElementsManipulationHelperTest >> testCountElement [
	"selection := {A1 . B1 . B2 . C1 . C3}.
	PyramidElementsManipulationHelper onlyParents: selection
	returns: { A1 . B1 . C1 }"

	self
		assert: (PyramidElementsManipulationHelper countElementsIn: {  })
		equals: 0.
	self
		assert: (PyramidElementsManipulationHelper countElementsIn:
				 { (self makeNestedElement: 1) })
		equals: 1.
	self
		assert: (PyramidElementsManipulationHelper countElementsIn:
				 { (self makeNestedElement: 10) })
		equals: 10.
	self
		assert: (PyramidElementsManipulationHelper countElementsIn:
				 { (self makeNestedElement: 10) . (self makeNestedElement: 10) . (self makeNestedElement: 10) })
		equals: 30
]

{ #category : #tests }
PyramidElementsManipulationHelperTest >> testFlattenChildrenOfCollection [

	| arrayOfElements test result |
	arrayOfElements := self arrayOfElements.
	test := {
		        (arrayOfElements at: 1) first.
		        (arrayOfElements at: 2) first firstChild }.
	result := PyramidElementsManipulationHelper
		          flattenChildrenOfCollection: test.
	self assert: result size equals: 5.
	self assert: (result includesAll: {
				 (arrayOfElements at: 1) first.
				 (arrayOfElements at: 1) first firstChild.
				 (arrayOfElements at: 1) first firstChild firstChild.
				 (arrayOfElements at: 2) first firstChild.
				 (arrayOfElements at: 2) first firstChild firstChild })
]

{ #category : #tests }
PyramidElementsManipulationHelperTest >> testOnlyParents [
	"selection := {A1 . B1 . B2 . C1 . C3}.
	PyramidElementsManipulationHelper onlyParents: selection
	returns: { A1 . B1 . C1 }"

	| arrayOfElements test result |
	arrayOfElements := self arrayOfElements.
	test := {
		        (arrayOfElements at: 1) first.
		        (arrayOfElements at: 2) first.
		(arrayOfElements at: 2) first firstChild.
		(arrayOfElements at: 3) first.
		(arrayOfElements at: 3) first firstChild firstChild }.
	result := PyramidElementsManipulationHelper onlyParents: test.
	self assert: result size equals: 3.
	self assert: (result includesAll: {
				 (arrayOfElements at: 1) first.
				 (arrayOfElements at: 2) first .
				 (arrayOfElements at: 3) first})
]
