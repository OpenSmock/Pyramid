Class {
	#name : #PyramidLibraryView,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'preview',
		'editor',
		'addButton'
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
				   ('Example' asRopedText )
					   asElement ];
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

{ #category : #initialization }
PyramidLibraryView >> initializePresenters [

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
