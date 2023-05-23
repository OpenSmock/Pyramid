Class {
	#name : #PyramidLibraryView,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'preview',
		'addRootButton',
		'editor',
		'addChildButton'
	],
	#category : #'Pyramid-Bloc-plugin-library'
}

{ #category : #accessing }
PyramidLibraryView >> addChildButton [

	^ addChildButton
]

{ #category : #adding }
PyramidLibraryView >> addOnRoot [

	self editor activeProject roots add: self list selectedItem blockMaker value
]

{ #category : #adding }
PyramidLibraryView >> addOnSelection [

	self editor activeProject roots isEmpty ifTrue: [ self addOnRoot. ^ self ].
	self editor activeProject selection do: [ :each |
		each addChild: self list selectedItem blockMaker value ].
	self editor activeProject roots informCollectionChanged
]

{ #category : #accessing }
PyramidLibraryView >> addRootButton [
	^ addRootButton
]

{ #category : #'as yet unclassified' }
PyramidLibraryView >> defaultItemsList [

	^ {
		  (PyramidLibraryElement new
			   title: 'Square red';
			   blockMaker: [
				   BlElement new
					   background: Color red;
					   id: #red;
					   yourself ];
			   yourself).
		  (PyramidLibraryElement new
			   title: 'Square green';
			   blockMaker: [
				   BlElement new
					   background: Color green;
					   id: #green;
					   yourself ];
			   yourself).
		  (PyramidLibraryElement new
			   title: 'Square blue';
			   blockMaker: [
				   BlElement new
					   background: Color blue;
					   id: #blue;
					   yourself ];
			   yourself).
			(PyramidLibraryElement new
			   title: 'Text';
			   blockMaker: [
				  'Example' asRopedText asElement ];
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
										      add: self addChildButton;
										      add: self addRootButton;
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

{ #category : #initialization }
PyramidLibraryView >> initializePresenters [

	addRootButton := SpButtonPresenter new
		                 label: 'Add as root';
		                 action: [ self addOnRoot ];
		                 yourself.
	addChildButton := SpButtonPresenter new
		                  label: 'Add as child';
		                  action: [ self addOnSelection ];
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
