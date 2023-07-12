Class {
	#name : #PyramidLibraryViewForRoot,
	#superclass : #PyramidLibraryView,
	#instVars : [
		'addRootButton'
	],
	#category : #'Pyramid-Bloc-plugin-library'
}

{ #category : #'as yet unclassified' }
PyramidLibraryViewForRoot >> buttonAction [

	self editor projectModel roots add: self list selectedItem blockMaker value
]

{ #category : #private }
PyramidLibraryViewForRoot >> buttonLabel [

	^ 'Add new root'
]
