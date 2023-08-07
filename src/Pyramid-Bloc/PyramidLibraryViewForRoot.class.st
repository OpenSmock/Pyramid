Class {
	#name : #PyramidLibraryViewForRoot,
	#superclass : #PyramidLibraryView,
	#category : #'Pyramid-Bloc-plugin-library'
}

{ #category : #'as yet unclassified' }
PyramidLibraryViewForRoot >> buttonAction [

	self editor propertiesManager commandExecutor use: PyramidAddToCollectionCommand new on: { 	self editor projectModel roots } with: self list selectedItem blockMaker value
]

{ #category : #private }
PyramidLibraryViewForRoot >> buttonLabel [

	^ 'Add new root'
]
