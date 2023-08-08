Class {
	#name : #PyramidVisibilitySortFunctionTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-bloc-utils'
}

{ #category : #tests }
PyramidVisibilitySortFunctionTest >> testSorting [

	| data sorted parent e1 e2 e3 e4 e5 |
	parent := BlElement new.
	e1 := BlElement new id: #e1; zIndex: 1; visibility: BlVisibility gone; yourself.
	e2 := BlElement new id: #e2; zIndex: 1; visibility: BlVisibility gone; yourself.
	e3 := BlElement new id: #e3; zIndex: 1; visibility: BlVisibility visible; yourself.
	e4 := BlElement new id: #e4; zIndex: 1; visibility: BlVisibility visible; yourself.
	e5 := BlElement new id: #e5; zIndex: 1; visibility: BlVisibility hidden; yourself.
	data := {
		        e1.
		        e2.
		        e3.
		        e4.
		        e5 }.
	parent addChildren: data.
	sorted := data sorted: PyramidVisibilitySortFunction new.
	self assert: sorted equals: {
			e3.
			e4.
			e5.
			e1.
			e2 }
]
