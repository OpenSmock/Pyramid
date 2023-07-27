Class {
	#name : #PyramidLibraryView,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'preview',
		'editor',
		'addButton',
		'idGenerator'
	],
	#category : #'Pyramid-Bloc-plugin-library'
}

{ #category : #initialization }
PyramidLibraryView >> addButton [
^ addButton
]

{ #category : #'as yet unclassified' }
PyramidLibraryView >> buttonAction [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyramidLibraryView >> buttonLabel [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyramidLibraryView >> defaultItemsList [

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

{ #category : #initialization }
PyramidLibraryView >> defaultLayout [

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
				   yourself)
]

{ #category : #accessing }
PyramidLibraryView >> editor [
	^ editor
]

{ #category : #accessing }
PyramidLibraryView >> editor: aPyramidEditor [

	editor := aPyramidEditor
]

{ #category : #accessing }
PyramidLibraryView >> idGenerator [

	^ idGenerator
]

{ #category : #initialization }
PyramidLibraryView >> initializePresenters [

	idGenerator:= Generator on: [ :generator |
		| index |
		index := 1.
		[ 	Character alphabet do: [ :each |
				| next suffix |
				next := each asUppercase asString.
				suffix := index = 1
					ifTrue: [ '' ]
					ifFalse: [ index asString ].
				generator yield: next, suffix ].
			index := index + 1 ] repeat ].

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

{ #category : #accessing }
PyramidLibraryView >> list [

	^ list
]

{ #category : #accessing }
PyramidLibraryView >> preview [
	^ preview
]

{ #category : #'as yet unclassified' }
PyramidLibraryView >> updatePreviewWith: aLibraryElement [

	self preview image: aLibraryElement form
]
