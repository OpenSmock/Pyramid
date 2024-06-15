Class {
	#name : 'PyramidLibraryContainerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'library',
		'idGenerator'
	],
	#classVars : [
		'IdGenerator'
	],
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'accessing' }
PyramidLibraryContainerPresenter class >> makeIdGenerator [
^ Generator on: [ :generator |
		  | index |
		  index := 1.
		  [
		  Character alphabet do: [ :each |
			  | next suffix |
			  next := each asUppercase asString.
			  suffix := index = 1
				            ifTrue: [ '' ]
				            ifFalse: [ index asString ].
			  generator yield: next , suffix ].
		  index := index + 1 ] repeat ]
]

{ #category : 'as yet unclassified' }
PyramidLibraryContainerPresenter >> buttonAction: aBlock [

	library addButton action: aBlock
]

{ #category : 'as yet unclassified' }
PyramidLibraryContainerPresenter >> buttonLabel: aString [

	library addButton label: aString
]

{ #category : 'initialization' }
PyramidLibraryContainerPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpLabelPresenter new
				   label: 'Library';
				   displayBold: [ :a | true ];
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: library width: 800;
				   yourself)
		  height: 400;
		  yourself.
]

{ #category : 'requirements' }
PyramidLibraryContainerPresenter >> elementToAdd [

	| array |
	array := self library elementToAdd.
	array do: [:each | each id: self idGenerator next; yourself].
	^ array
]

{ #category : 'accessing' }
PyramidLibraryContainerPresenter >> idGenerator [

	idGenerator ifNil: [ idGenerator := self class makeIdGenerator ].
	^ idGenerator
]

{ #category : 'accessing' }
PyramidLibraryContainerPresenter >> idGenerator: anObject [

	idGenerator := anObject
]

{ #category : 'initialization' }
PyramidLibraryContainerPresenter >> initializePresenters [

	library := PyramidElementToAddPresenter new.

]

{ #category : 'requirements' }
PyramidLibraryContainerPresenter >> library [

	^ library
]

{ #category : 'requirements' }
PyramidLibraryContainerPresenter >> library: aLibrary [

	library := aLibrary
]
