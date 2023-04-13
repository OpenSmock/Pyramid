Class {
	#name : #PyramidLibraryView,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'preview',
		'addRootButton',
		'editor'
	],
	#category : #'NeoPyramid-plugin-adders'
}

{ #category : #adding }
PyramidLibraryView >> addOnRoot [

	self editor activeProject roots add: self list selectedItem blockMaker value
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
			   yourself) }
]

{ #category : #initialization }
PyramidLibraryView >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self list width: 200;
		  add: (SpBoxLayout newVertical
				   spacing: 4;
				   add: self preview expand: true;
				   add: (SpBoxLayout newVertical spacing: 4;
						    add: SpNullPresenter new expand: true;
						    add: self addRootButton expand: false;
						    yourself)
				   expand: false;
				   yourself)
		  width: 300;
		  yourself
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
	preview := SpImagePresenter new.
	list := SpListPresenter new
		        beSingleSelection;
		        dragEnabled: true;
		        items: self defaultItemsList;
		        whenSelectedDo: [ :element |
			        self updatePreviewWith: element ];
		        selectFirst;
		        yourself.

	
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
