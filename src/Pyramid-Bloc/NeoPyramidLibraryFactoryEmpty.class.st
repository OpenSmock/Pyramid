Class {
	#name : 'NeoPyramidLibraryFactoryEmpty',
	#superclass : 'NeoPyramidLibraryFactory',
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'testing' }
NeoPyramidLibraryFactoryEmpty >> canMakeNewElement [

	^ false
]

{ #category : 'as yet unclassified' }
NeoPyramidLibraryFactoryEmpty >> makeForm [

	^ BlElement new asForm
]
