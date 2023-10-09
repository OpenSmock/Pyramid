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
		use: PyramidAddChildCommand new
		on: self editor projectModel selection
		with: self list selectedItem blockMaker value
]

{ #category : 'private' }
PyramidLibraryPresenterForElement >> buttonLabel [

	^ 'Add new child'
]
