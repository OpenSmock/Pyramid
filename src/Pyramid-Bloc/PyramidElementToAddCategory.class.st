Class {
	#name : #PyramidElementToAddCategory,
	#superclass : #Object,
	#instVars : [
		'name',
		'icon',
		'factories'
	],
	#category : #'Pyramid-Bloc-plugin-tree-library'
}

{ #category : #comparing }
PyramidElementToAddCategory >> <= aPyramidLibraryCategory [

	^ self name <= aPyramidLibraryCategory name
]

{ #category : #converting }
PyramidElementToAddCategory >> asNotebookPage [

	^ SpNotebookPage
		  title: self name
		  icon: self icon
		  provider: [self makeProvider]
]

{ #category : #accessing }
PyramidElementToAddCategory >> factories [

	^ factories
]

{ #category : #accessing }
PyramidElementToAddCategory >> factories: anObject [

	factories := anObject
]

{ #category : #accessing }
PyramidElementToAddCategory >> icon [

	^ icon
]

{ #category : #accessing }
PyramidElementToAddCategory >> icon: anObject [

	icon := anObject
]

{ #category : #'as yet unclassified' }
PyramidElementToAddCategory >> makeProvider [

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

{ #category : #accessing }
PyramidElementToAddCategory >> name [

	^ name
]

{ #category : #accessing }
PyramidElementToAddCategory >> name: anObject [

	name := anObject
]
