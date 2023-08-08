Class {
	#name : #PyramidElevationSortFunctionTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-bloc-utils'
}

{ #category : #tests }
PyramidElevationSortFunctionTest >> testSorting [

	| data sorted parent e1 e2 e3 e4 e5 |
	parent := BlElement new.
	e1 := BlElement new zIndex: 1.
	e2 := BlElement new zIndex: 5.
	e3 := BlElement new zIndex: 4.
	e4 := BlElement new zIndex: 3.
	e5 := BlElement new zIndex: 1.
	data := {
		        e1.
		        e2.
		        e3.
		        e4.
		        e5 }.
	parent addChildren: data.
	sorted := data sorted: PyramidElevationSortFunction new.
	self assert: sorted equals: {
			e2.
			e3.
			e4.
			e5.
			e1 }
]
