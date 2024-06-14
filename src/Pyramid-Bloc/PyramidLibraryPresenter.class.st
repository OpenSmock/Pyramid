Class {
	#name : 'PyramidLibraryPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'editor',
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
PyramidLibraryPresenter class >> makeIdGenerator [
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
PyramidLibraryPresenter >> buttonAction [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
PyramidLibraryPresenter >> buttonLabel [

	^ self shouldBeImplemented
]

{ #category : 'initialization' }
PyramidLibraryPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: library width: 800;
		  yourself
]

{ #category : 'accessing' }
PyramidLibraryPresenter >> editor [
	^ editor
]

{ #category : 'accessing' }
PyramidLibraryPresenter >> editor: aPyramidEditor [

	editor := aPyramidEditor
]

{ #category : 'requirements' }
PyramidLibraryPresenter >> elementToAdd [

	| array |
	array := self library elementToAdd.
	array do: [:each | each id: self idGenerator next; yourself].
	^ array
]

{ #category : 'accessing' }
PyramidLibraryPresenter >> idGenerator [

	idGenerator ifNil: [ idGenerator := self class makeIdGenerator ].
	^ idGenerator
]

{ #category : 'accessing' }
PyramidLibraryPresenter >> idGenerator: anObject [

	idGenerator := anObject
]

{ #category : 'initialization' }
PyramidLibraryPresenter >> initializePresenters [

	library := NeoPyramidLibraryPresenter new.
	library addButton label: self buttonLabel.
	library addButton action: [ self buttonAction ]
]

{ #category : 'requirements' }
PyramidLibraryPresenter >> library [

	^ library
]
