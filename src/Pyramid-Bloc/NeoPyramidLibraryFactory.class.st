Class {
	#name : 'NeoPyramidLibraryFactory',
	#superclass : 'Object',
	#instVars : [
		'elementIcon',
		'elementName',
		'elementBlock'
	],
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'comparing' }
NeoPyramidLibraryFactory >> <= aPyramidLibraryCategory [

	^ self elementName <= aPyramidLibraryCategory elementName
]

{ #category : 'testing' }
NeoPyramidLibraryFactory >> canMakeNewElement [

	[self elementBlock value] on: Error do: [ ^ false ].
	^ true
]

{ #category : 'accessing' }
NeoPyramidLibraryFactory >> elementBlock [

	^ elementBlock
]

{ #category : 'accessing' }
NeoPyramidLibraryFactory >> elementBlock: anObject [

	elementBlock := anObject
]

{ #category : 'accessing' }
NeoPyramidLibraryFactory >> elementIcon [

	^ elementIcon
]

{ #category : 'accessing' }
NeoPyramidLibraryFactory >> elementIcon: anObject [

	elementIcon := anObject
]

{ #category : 'accessing' }
NeoPyramidLibraryFactory >> elementName [

	^ elementName
]

{ #category : 'accessing' }
NeoPyramidLibraryFactory >> elementName: anObject [

	elementName := anObject
]

{ #category : 'as yet unclassified' }
NeoPyramidLibraryFactory >> makeElement [

	^ self elementBlock value
]

{ #category : 'as yet unclassified' }
NeoPyramidLibraryFactory >> makeForm [

	| array |
	array := self elementBlock value.
	^ BlElement new
		  size: 800 @ 600;
		  addChildren: array;
			clipChildren: false;
		  asForm
]
