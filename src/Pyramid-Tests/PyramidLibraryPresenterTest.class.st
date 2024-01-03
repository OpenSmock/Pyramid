Class {
	#name : #PyramidLibraryPresenterTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-tree-library'
}

{ #category : #tests }
PyramidLibraryPresenterTest >> testIdGenerator [
	"We generate a bunch of id and we verify that none are the same"

	| treePlugin libraryPresForElements libraryPresForFirstLevel elements |
	treePlugin := PyramidTreePlugin new.
	libraryPresForElements := treePlugin libraryPresenterForElement.
	libraryPresForFirstLevel := treePlugin libraryPresenterForRoot.
	elements := Bag new.
	1 to: 100 do: [ :i |
		elements add:
			libraryPresForElements list selectedItem blockMaker value id
				asSymbol ].
	1 to: 100 do: [ :i |
		elements add:
			libraryPresForFirstLevel list selectedItem blockMaker value id
				asSymbol ].
	self assert: elements size equals: 200.
	self assert: elements asSet size equals: 200
]
