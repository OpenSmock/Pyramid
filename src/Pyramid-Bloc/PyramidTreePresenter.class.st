Class {
	#name : #PyramidTreePresenter,
	#superclass : #SpPresenter,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'buttonAddToRoots',
		'tree',
		'columns',
		'libraryPresenterForRoot',
		'projectModel',
		'editorMenuBuilder',
		'shouldUpdateSelection'
	],
	#category : #'Pyramid-Bloc-plugin-tree-library'
}

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> actionAddNewElement [
(PyramidPopoverFactory
				                  makeWithPresenter: self libraryPresenterForRoot
				                  relativeTo: self buttonAddToRoots
				                  position: SpPopoverPosition right) popup
]

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> actionEditorMenu [

	^ self editorMenuBuilder menuFor: self projectModel selection.
]

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> actionSelectionChanged: aCollection [

	self projectModel ifNil: [ ^ self ].
	self shouldUpdateSelection ifFalse: [ ^ self ].
	self shouldUpdateSelection: false.
	[
	self projectModel selection replaceAll:
		aCollection selectedItems ] ensure: [
		self shouldUpdateSelection: true ]
]

{ #category : #accessing }
PyramidTreePresenter >> buttonAddToRoots [

	^ buttonAddToRoots
]

{ #category : #accessing }
PyramidTreePresenter >> columns [

	^ columns
]

{ #category : #layout }
PyramidTreePresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self buttonAddToRoots expand: false;
		  add: self tree expand: true;
		  yourself
]

{ #category : #accessing }
PyramidTreePresenter >> editorMenuBuilder [

	^ editorMenuBuilder
]

{ #category : #accessing }
PyramidTreePresenter >> editorMenuBuilder: anObject [

	editorMenuBuilder := anObject
]

{ #category : #initialization }
PyramidTreePresenter >> initializePresenters [

	shouldUpdateSelection := true.
	tree := SpTreeTablePresenter new
		        beMultipleSelection;
		        beResizable;
		        roots: {  };
		        children: [ :each | each children ];
		        contextMenu: [ self actionEditorMenu ];
		        whenSelectionChangedDo: [ :selection |
			        self actionSelectionChanged: selection ];
		        expandAll.

	columns := OrderedCollection new.

	buttonAddToRoots := SpButtonPresenter new
		                    label: 'Add new element';
		                    icon: (self iconNamed: #add);
		                    action: [ self actionAddNewElement ];
		                    help:
			                    'Add a new element on the roots of the design.';
				                    yourself
]

{ #category : #accessing }
PyramidTreePresenter >> libraryPresenterForRoot [

	^ libraryPresenterForRoot
]

{ #category : #accessing }
PyramidTreePresenter >> libraryPresenterForRoot: anObject [

	libraryPresenterForRoot := anObject
]

{ #category : #accessing }
PyramidTreePresenter >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidTreePresenter >> projectModel: anObject [

	projectModel ifNotNil: [ projectModel removeObserver: self ].
	projectModel := anObject.
	projectModel addObserver: self 
	
]

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> pyramidElementsChanged [

	self updateRoots.
	self selectionHaveChanged ifTrue: [ self updateSelection ].
]

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> pyramidRootsChanged [

	self updateRoots .
	self updateSelection
]

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> pyramidSelectionChanged [

	self updateSelection
]

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> selectionHaveChanged [

	self tree selectedItems size = self projectModel selection size ifFalse: [
		^ true ].
	(self tree selectedItems includesAll: self projectModel selection) ifFalse: [
		^ true ].
	(self projectModel selection includesAll: self tree selectedItems) ifFalse: [
		^ true ].
	^ false
]

{ #category : #accessing }
PyramidTreePresenter >> shouldUpdateSelection [

	^ shouldUpdateSelection
]

{ #category : #accessing }
PyramidTreePresenter >> shouldUpdateSelection: anObject [

	shouldUpdateSelection := anObject
]

{ #category : #accessing }
PyramidTreePresenter >> tree [

	^ tree
]

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> updateRoots [

	self shouldUpdateSelection: false.
	[
	self tree roots: self projectModel roots asArray ] ensure: [ self shouldUpdateSelection: true ]
]

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> updateSelection [

	self projectModel ifNil: [ ^ self ].
	self shouldUpdateSelection ifFalse: [ ^ self ].
	self shouldUpdateSelection: false.
	[
	self tree unselectAll.
	self projectModel selection
		ifNotEmpty: [ self tree selectItems: self projectModel selection ] ]
		ensure: [ self shouldUpdateSelection: true ]
]

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> updateTree [

	self tree columns: {  }.
	self columns do: [ :each | tree addColumn: each ]
]
