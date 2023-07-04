Class {
	#name : #PyramidPluginLibrary,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'addButton',
		'libraryView'
	],
	#category : #'Pyramid-Bloc-plugin-library'
}

{ #category : #'as yet unclassified' }
PyramidPluginLibrary class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #accessing }
PyramidPluginLibrary >> addButton [
^ addButton
]

{ #category : #'as yet unclassified' }
PyramidPluginLibrary >> connectOn: aPyramidEditor [

	self libraryView editor: aPyramidEditor
]

{ #category : #initialization }
PyramidPluginLibrary >> initialize [

	libraryView := PyramidLibraryViewForElement new.
	addButton := SpButtonPresenter new
		             icon: (self iconNamed: #add);
		             action: [
			             (PyramidPopoverFactory
				              makeWithPresenter: libraryView
				              relativeTo: self addButton
				              position: SpPopoverPosition right) popup ];
		             yourself
]

{ #category : #accessing }
PyramidPluginLibrary >> libraryView [
	^ libraryView
]
