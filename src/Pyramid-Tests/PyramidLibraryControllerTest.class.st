Class {
	#name : #PyramidLibraryControllerTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-navigation'
}

{ #category : #tests }
PyramidLibraryControllerTest >> testOpenForRoot [
	"We generate a bunch of id and we verify that none are the same"

	| controller editor element |
	controller := PyramidLibraryController new.
	editor := PyramidEditor new.
	controller editor: editor.
	element := PyramidLibraryElement new
		           block: [
			           {
				           BlElement new.
				           BlElement new.
				           BlElement new.
				           BlElement new.
				           BlElement new } ];
		           yourself.
	self assert: editor projectModel firstLevelElements size equals: 0.
	self assert: editor projectModel selection size equals: 0.

	controller openForRoot.
	controller addNewElement: element.
	self assert: editor projectModel firstLevelElements size equals: 5.
	self assert: editor projectModel selection size equals: 0.
]

{ #category : #tests }
PyramidLibraryControllerTest >> testOpenForSelection [

	| controller editor element selectedElement |
	controller := PyramidLibraryController new.
	editor := PyramidEditor new.
	controller editor: editor.
	element := PyramidLibraryElement new
		           block: [
			           {
				           BlElement new.
				           BlElement new.
				           BlElement new.
				           BlElement new.
				           BlElement new } ];
		           yourself.
	selectedElement := BlElement new.
	editor projectModel selection add: selectedElement.
	self assert: editor projectModel firstLevelElements size equals: 0.
	self assert: selectedElement children size equals: 0.

	controller openForRoot.
	controller addNewElement: element.
	self assert: editor projectModel firstLevelElements size equals: 5.
	self assert: selectedElement children size equals: 0
]

{ #category : #tests }
PyramidLibraryControllerTest >> testRenameElements [
	"We generate a bunch of id and we verify that none are the same"

	| controller elementIds elements |
	controller := PyramidLibraryController new.
	elements := {
		            BlElement new.
		            BlElement new.
		            BlElement new.
		            BlElement new.
		            BlElement new }.

	elementIds := Bag new.
	1 to: 200 do: [ :i |
		controller renameElements: elements.
		elementIds addAll: (elements collect: [ :each | each id asSymbol ]) ].

	self assert: elementIds size equals: 1000.
	self assert: elementIds asSet size equals: 1000
]
