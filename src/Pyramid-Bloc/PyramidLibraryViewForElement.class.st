Class {
	#name : #PyramidLibraryViewForElement,
	#superclass : #PyramidLibraryView,
	#category : #'Pyramid-Bloc-plugin-library'
}

{ #category : #'as yet unclassified' }
PyramidLibraryViewForElement >> buttonAction [

	self editor propertiesManager commandExecutor
		use: PyramidAddChildCommand new
		on: self editor projectModel selection
		with: self list selectedItem blockMaker value
]

{ #category : #private }
PyramidLibraryViewForElement >> buttonLabel [

	^ 'Add new child'
]
