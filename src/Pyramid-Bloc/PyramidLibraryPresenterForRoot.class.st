Class {
	#name : 'PyramidLibraryPresenterForRoot',
	#superclass : 'PyramidLibraryPresenter',
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'as yet unclassified' }
PyramidLibraryPresenterForRoot >> buttonAction [

	self editor propertiesManager commandExecutor use: PyramidAddToCollectionCommand new on: { 	self editor projectModel roots } with: self list selectedItem blockMaker value
]

{ #category : 'private' }
PyramidLibraryPresenterForRoot >> buttonLabel [

	^ 'Add new root'
]
