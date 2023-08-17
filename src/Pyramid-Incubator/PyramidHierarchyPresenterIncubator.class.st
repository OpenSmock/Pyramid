Class {
	#name : #PyramidHierarchyPresenterIncubator,
	#superclass : #SpPresenter,
	#instVars : [
		'tree',
		'search',
		'buttonAddRoot',
		'libraryView'
	],
	#category : #'Pyramid-Incubator-plugin-hierarchy-selection-helper'
}

{ #category : #accessing }
PyramidHierarchyPresenterIncubator >> buttonAddRoot [
^ buttonAddRoot
]

{ #category : #accessing }
PyramidHierarchyPresenterIncubator >> connectOn: aPyramidEditor [

	self search projectModel: aPyramidEditor projectModel.
	self tree connectOn: aPyramidEditor.
	self libraryView editor: aPyramidEditor
]

{ #category : #initialization }
PyramidHierarchyPresenterIncubator >> defaultLayout [

	^ SpPanedLayout newVertical
		  positionOfSlider: 2/3;
		  add: (SpBoxLayout newVertical
				   spacing: 4;
				   add: self buttonAddRoot expand: false;
				   add: self tree;
				   yourself);
		  add: self search;
		  yourself
]

{ #category : #initialization }
PyramidHierarchyPresenterIncubator >> initializePresenters [

	tree := PyramidTreePresenterIncubator new.
	search := PyramidSearchAndSelectPresenter new.
	libraryView := PyramidLibraryPresenterForRoot new.
	buttonAddRoot := SpButtonPresenter new
		                 label: 'Add root';
		                 icon: (self iconNamed: #add);
		                 action: [
			                 (PyramidPopoverFactory
				                  makeWithPresenter: libraryView
				                  relativeTo: self buttonAddRoot
				                  position: SpPopoverPosition right) popup ];
		                 yourself
]

{ #category : #accessing }
PyramidHierarchyPresenterIncubator >> libraryView [
^ libraryView
]

{ #category : #accessing }
PyramidHierarchyPresenterIncubator >> projectModel: aPyramidProject [

	self search projectModel: aPyramidProject
]

{ #category : #accessing }
PyramidHierarchyPresenterIncubator >> search [

	^ search
]

{ #category : #initialization }
PyramidHierarchyPresenterIncubator >> tree [
^ tree
]
