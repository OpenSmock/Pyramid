Class {
	#name : 'PyramidLibraryPresenterForFirstLevelElement',
	#superclass : 'PyramidLibraryPresenter',
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'as yet unclassified' }
PyramidLibraryPresenterForFirstLevelElement >> buttonAction [

	self editor propertiesManager commandExecutor
		use: PyramidAddToCollectionCommand new
		on: { self editor projectModel firstLevelElements }
		with: self list selectedItem blockMaker value
]

{ #category : 'private' }
PyramidLibraryPresenterForFirstLevelElement >> buttonLabel [

	^ 'Add new on first level'
]
