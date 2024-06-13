Class {
	#name : 'PyramidAbstractColumnsBuilder',
	#superclass : 'Object',
	#instVars : [
		'editor'
	],
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'testing' }
PyramidAbstractColumnsBuilder class >> isAbstract [

	^ self == PyramidAbstractColumnsBuilder
]

{ #category : 'as yet unclassified' }
PyramidAbstractColumnsBuilder >> buildOn: aPyramidTreePlugin [
"aPyramidTreePlugin addColumns: {  }"
	self shouldBeImplemented
	
]

{ #category : 'accessing' }
PyramidAbstractColumnsBuilder >> editor [

	editor ifNil: [ Error signal: 'Editor should not be nil.' ].
	^ editor
]

{ #category : 'accessing' }
PyramidAbstractColumnsBuilder >> editor: anObject [

	editor := anObject
]
