Class {
	#name : #PyramidLibraryViewForElement,
	#superclass : #PyramidLibraryView,
	#instVars : [
		'addChildButton'
	],
	#category : #'Pyramid-Bloc-plugin-library'
}

{ #category : #'as yet unclassified' }
PyramidLibraryViewForElement >> buttonAction [

	self editor projectModel selection do: [ :each |
		each addChild: self list selectedItem blockMaker value ].
	self editor projectModel informRootsChanged
]

{ #category : #private }
PyramidLibraryViewForElement >> buttonLabel [

	^ 'Add new child'
]
