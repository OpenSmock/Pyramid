Class {
	#name : 'PyramidElementToAddFactory',
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
PyramidElementToAddFactory >> <= aPyramidLibraryCategory [

	^ self elementName <= aPyramidLibraryCategory elementName
]

{ #category : 'testing' }
PyramidElementToAddFactory >> canMakeNewElement [

	[self elementBlock value] on: Error do: [ ^ false ].
	^ true
]

{ #category : 'accessing' }
PyramidElementToAddFactory >> elementBlock [

	^ elementBlock
]

{ #category : 'accessing' }
PyramidElementToAddFactory >> elementBlock: anObject [

	elementBlock := anObject
]

{ #category : 'accessing' }
PyramidElementToAddFactory >> elementIcon [

	^ elementIcon
]

{ #category : 'accessing' }
PyramidElementToAddFactory >> elementIcon: anObject [

	elementIcon := anObject
]

{ #category : 'accessing' }
PyramidElementToAddFactory >> elementName [

	^ elementName
]

{ #category : 'accessing' }
PyramidElementToAddFactory >> elementName: anObject [

	elementName := anObject
]

{ #category : 'as yet unclassified' }
PyramidElementToAddFactory >> makeElement [

	^ self elementBlock value
]

{ #category : 'as yet unclassified' }
PyramidElementToAddFactory >> makeForm [

	| array |
	array := self elementBlock value.
	^ BlElement new
		  size: 800 @ 600;
		  addChildren: array;
			clipChildren: false;
		  asForm
]
