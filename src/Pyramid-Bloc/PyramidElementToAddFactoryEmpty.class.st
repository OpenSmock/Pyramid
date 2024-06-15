Class {
	#name : 'PyramidElementToAddFactoryEmpty',
	#superclass : 'PyramidElementToAddFactory',
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'testing' }
PyramidElementToAddFactoryEmpty >> canMakeNewElement [

	^ false
]

{ #category : 'as yet unclassified' }
PyramidElementToAddFactoryEmpty >> makeForm [

	^ BlElement new asForm
]
