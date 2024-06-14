Class {
	#name : 'NeoPyramidLibraryCategory',
	#superclass : 'Object',
	#instVars : [
		'name',
		'icon',
		'factories'
	],
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'comparing' }
NeoPyramidLibraryCategory >> <= aPyramidLibraryCategory [

	^ self name <= aPyramidLibraryCategory name
]

{ #category : 'converting' }
NeoPyramidLibraryCategory >> asNotebookPage [

	^ SpNotebookPage
		  title: self name
		  icon: self icon
		  provider: [self makeProvider]
]

{ #category : 'accessing' }
NeoPyramidLibraryCategory >> factories [

	^ factories
]

{ #category : 'accessing' }
NeoPyramidLibraryCategory >> factories: anObject [

	factories := anObject
]

{ #category : 'accessing' }
NeoPyramidLibraryCategory >> icon [

	^ icon
]

{ #category : 'accessing' }
NeoPyramidLibraryCategory >> icon: anObject [

	icon := anObject
]

{ #category : 'as yet unclassified' }
NeoPyramidLibraryCategory >> makeProvider [

	^ 
	  SpTablePresenter new
		  addColumn: ((SpImageTableColumn
				    title: 'Icon'
				    evaluated: [ :aFactory | aFactory elementIcon ])
				   width: 50;
				   yourself);
		  addColumn:
		  (SpStringTableColumn title: 'Name' evaluated: #elementName);
		  items: self factories;
		  beResizable;
		  yourself
]

{ #category : 'accessing' }
NeoPyramidLibraryCategory >> name [

	^ name
]

{ #category : 'accessing' }
NeoPyramidLibraryCategory >> name: anObject [

	name := anObject
]
