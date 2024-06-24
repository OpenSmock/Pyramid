Class {
	#name : 'PyramidLibraryPresenterTest',
	#superclass : 'TestCase',
	#category : 'Pyramid-Tests-cases-plugin-tree-library',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-tree-library'
}

{ #category : 'tests' }
PyramidLibraryPresenterTest >> testIdGenerator [
	"We generate a bunch of id and we verify that none are the same"

	| treePlugin libraryPresForElements libraryPresForFirstLevel elementIds |
	treePlugin := PyramidTreePlugin new.
	libraryPresForElements := treePlugin libraryPresenterForElement.
	libraryPresForFirstLevel := treePlugin libraryPresenterForRoot.
	libraryPresForElements library currentFactory:
		(PyramidElementToAddFactory new
			 elementBlock: [
				 {
					 BlElement new.
					 BlElement new } ];
			 yourself).
	libraryPresForFirstLevel library currentFactory:
		(PyramidElementToAddFactory new
			 elementBlock: [
				 {
					 BlElement new.
					 BlElement new } ];
			 yourself).

	elementIds := Bag new.
	1 to: 100 do: [ :i |
		elementIds addAll:
			(libraryPresForElements elementToAdd collect: [ :each |
				 each id asSymbol ]) ].
	1 to: 100 do: [ :i |
		elementIds addAll:
			(libraryPresForFirstLevel elementToAdd collect: [ :each |
				 each id asSymbol ]) ].
	self assert: elementIds size equals: 400.
	self assert: elementIds asSet size equals: 400.
]
