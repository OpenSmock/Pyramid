Class {
	#name : 'PyramidLibraryPresenterForElement',
	#superclass : 'PyramidLibraryPresenter',
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'as yet unclassified' }
PyramidLibraryPresenterForElement >> buttonAction [

	self editor propertiesManager commandExecutor
		use: PyramidAddChildrenCommand new
		on: self editor projectModel selection
		with: self elementToAdd
]

{ #category : 'private' }
PyramidLibraryPresenterForElement >> buttonLabel [

	^ 'Add new child'
]
