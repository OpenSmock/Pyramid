Class {
	#name : 'PyramidElementIdSortFunctionTest',
	#superclass : 'TestCase',
	#category : 'Pyramid-Tests-cases-bloc-utils',
	#package : 'Pyramid-Tests',
	#tag : 'cases-bloc-utils'
}

{ #category : 'tests' }
PyramidElementIdSortFunctionTest >> testSorting [

	| data sorted parent e1 e2 e3 e4 e5 |
	parent := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new id: #e2.
	e3 := BlElement new id: #e3.
	e4 := BlElement new id: #e4.
	e5 := BlElement new id: #e5.
	data := {
		        e3.
		        e1.
		        e2.
		        e5.
		        e4 }.
	parent addChildren: data.
	sorted := data sorted: PyramidElementIdSortFunction new.
	self assert: sorted equals: {
			e2.
			e3.
			e4.
			e5.
			e1 }
]
