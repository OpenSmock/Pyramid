Class {
	#name : #PyramidTreeMenuGroup,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-hierarchy'
}

{ #category : #'as yet unclassified' }
PyramidTreeMenuGroup class >> addNewElement: aPyramidTreePresenter [

	aPyramidTreePresenter editor activeProject selection ifEmpty: [
		^ [ :g |  ] ].

	^ [ :aGroup |
	  aGroup addItem: [ :anItem |
		  anItem
			  name: 'Add new element';
			  icon: (self iconNamed: #add);
			  action: [
				  (PyramidPopoverFactory
					   makeWithPresenter: (PyramidLibraryViewForElement new
							    editor: aPyramidTreePresenter editor;
							    yourself)
					   relativeTo: aPyramidTreePresenter
					   position: SpPopoverPosition right) popup ] ] ]
]

{ #category : #'as yet unclassified' }
PyramidTreeMenuGroup class >> browseAndInspect: aPyramidTreePresenter [

	| menuInspect menuBrowse |
	aPyramidTreePresenter editor activeProject selection ifEmpty: [
		^ [ :g |  ] ].

	menuInspect := SpMenuItemPresenter new icon:
		               (self iconNamed: #smallInspectIt).
	menuBrowse := SpMenuItemPresenter new
		              name: 'Browse';
		              icon: (self iconNamed: #nautilus);
		              action: [
			              aPyramidTreePresenter editor activeProject selection
				              first browse ];
		              yourself.

	aPyramidTreePresenter editor activeProject selection size = 1
		ifTrue: [
			menuInspect
				name: 'Inspect selected item';
				action: [ aPyramidTreePresenter editor activeProject selection first inspect ] ]
		ifFalse: [
			menuInspect
				name: 'Inspect selected group';
				action: [ aPyramidTreePresenter editor activeProject selection asArray inspect ] ].

	^ [ :aGroup |
	  aGroup
		  addMenuItem: menuBrowse;
		  addMenuItem: menuInspect ]
]

{ #category : #'as yet unclassified' }
PyramidTreeMenuGroup class >> removeElement: aPyramidTreePresenter [

	aPyramidTreePresenter editor activeProject selection ifEmpty: [
		^ [ :g |  ] ].

	^ [ :aGroup |
	  aGroup addItem: [ :anItem |
		  anItem
			  name: 'Remove selection';
			  icon: (self iconNamed: #delete);
			  action: [
				  aPyramidTreePresenter editor activeProject removeSelection ] ] ]
]
