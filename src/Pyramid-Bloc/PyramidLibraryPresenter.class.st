Class {
	#name : 'PyramidLibraryPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'list',
		'preview',
		'editor',
		'addButton',
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

{ #category : 'initialization' }
PyramidLibraryPresenter >> addButton [
^ addButton
]

{ #category : 'as yet unclassified' }
PyramidLibraryPresenter >> buttonAction [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
PyramidLibraryPresenter >> buttonLabel [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
PyramidLibraryPresenter >> defaultItemsList [

	^ {
		  (PyramidLibraryElement new
			   title: 'Square with randomized color';
			   blockMaker: [
				   BlElement new
					   background: Color random;
					   id: self idGenerator next;
					   yourself ];
			   yourself).
		  (PyramidLibraryElement new
			   title: 'Text';
			   blockMaker: [
				   'text' asRopedText asElement
					   id: self idGenerator next;
					   yourself ];
			   yourself) }
]

{ #category : 'initialization' }
PyramidLibraryPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpLabelPresenter new
				   label: 'Library';
				   displayBold: [ :a | true ];
				   yourself);
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self list width: 200;
				   add: (SpBoxLayout newVertical
						    spacing: 4;
						    add: self preview expand: true;
						    add: (SpBoxLayout newVertical
								     spacing: 4;
								     add: SpNullPresenter new expand: true;
								     add: (SpBoxLayout newHorizontal
										      spacing: 4;
										      add: self addButton;
										      yourself)
								     expand: false;
								     yourself)
						    expand: false;
						    yourself)
				   width: 300;
				   yourself); yourself
]

{ #category : 'accessing' }
PyramidLibraryPresenter >> editor [
	^ editor
]

{ #category : 'accessing' }
PyramidLibraryPresenter >> editor: aPyramidEditor [

	editor := aPyramidEditor
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

	addButton := SpButtonPresenter new
		             label: self buttonLabel;
		             action: [ self buttonAction ];
		             yourself.
	preview := SpImagePresenter new.
	list := SpListPresenter new
		        beSingleSelection;
		        dragEnabled: true;
		        items: self defaultItemsList;
		        display: [ :each | each title ];
		        whenSelectedDo: [ :element |
			        self updatePreviewWith: element ];
		        selectFirst;
		        yourself
]

{ #category : 'accessing' }
PyramidLibraryPresenter >> list [

	^ list
]

{ #category : 'accessing' }
PyramidLibraryPresenter >> preview [
	^ preview
]

{ #category : 'as yet unclassified' }
PyramidLibraryPresenter >> updatePreviewWith: aLibraryElement [

	self preview image: aLibraryElement form
]
