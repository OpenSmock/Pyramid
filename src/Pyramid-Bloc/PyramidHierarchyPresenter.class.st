Class {
	#name : #PyramidHierarchyPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tree',
		'search',
		'buttonAddRoot',
		'libraryView'
	],
	#category : #'Pyramid-Bloc-plugin-hierarchy'
}

{ #category : #accessing }
PyramidHierarchyPresenter >> buttonAddRoot [
^ buttonAddRoot
]

{ #category : #accessing }
PyramidHierarchyPresenter >> connectOn: aPyramidEditor [

	self search projectModel: aPyramidEditor projectModel.
	self tree connectOn: aPyramidEditor.
	self libraryView editor: aPyramidEditor
]

{ #category : #initialization }
PyramidHierarchyPresenter >> defaultLayout [

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
PyramidHierarchyPresenter >> initializePresenters [

	tree := PyramidTreePresenter new.
	search := PyramidSearchAndSelectPresenter new.
	libraryView := PyramidLibraryViewForRoot new.
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
PyramidHierarchyPresenter >> libraryView [
^ libraryView
]

{ #category : #accessing }
PyramidHierarchyPresenter >> projectModel: aPyramidProject [

	self search projectModel: aPyramidProject
]

{ #category : #accessing }
PyramidHierarchyPresenter >> search [

	^ search
]

{ #category : #initialization }
PyramidHierarchyPresenter >> tree [
^ tree
]
