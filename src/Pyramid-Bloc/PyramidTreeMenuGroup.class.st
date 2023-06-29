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
PyramidTreeMenuGroup class >> contextNotWorkingButton: aPyramidTreePresenter [

	| context selection |
	selection := aPyramidTreePresenter editor activeProject selection.
	context := SpMenuItemPresenter new
		           enabled: false;
		           yourself.
	selection ifEmpty: [ context name: 'No element in selection' ].

	selection size = 1 ifTrue: [
		context icon: (self iconNamed: selection systemIconName).
		context name:
			selection first id asSymbol , ' '
			, selection first hash printString ].
	selection size > 1 ifTrue: [
		context icon: (self iconNamed: #collection).
		context name: selection size printString , ' elements' ].

	^ [ :aGroup | aGroup addMenuItem: context ]
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
