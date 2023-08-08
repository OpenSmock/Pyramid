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
PyramidTreePresenter class >> columnNameAndType [

	^ SpCompositeTableColumn new
		  title: 'Elements';
		  addColumn: (SpImageTableColumn evaluated: [ :aClass |
					   self iconNamed: aClass systemIconName ]);
		  addColumn: (SpStringTableColumn new
				   title: 'Class';
				   evaluated: [ :aClass | aClass class name ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Identity';
				   evaluated: [ :aClass | aClass identityHash printString ];
				   displayColor: [ :aClass | Color gray ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Identifier';
				   evaluated: [ :aClass |
					   aClass id isNoId
						   ifTrue: [ '' ]
						   ifFalse: [ aClass id asSymbol ] ];
				   displayColor: [ :aClass |
					   aClass id isNoId
						   ifTrue: [ Color green ]
						   ifFalse: [ Smalltalk ui theme textColor ] ];
				   yourself);
		  yourself
]

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
		  add: self treeWithColumns expand: true;
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
PyramidTreePresenter >> initializeColumns [
	"Add to #columns collection all column of the tree. A column should be an instance of `SpTableColumn`."

	self columns add: self class columnNameAndType
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
	self initializeColumns.

	buttonAddToRoots := SpButtonPresenter new
		                    label: 'Add new element';
		                    icon: (self iconNamed: #add);
		                    action: [ self actionAddNewElement ];
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
PyramidTreePresenter >> rootsHaveChanged [

	
	self tree roots size = self projectModel roots size ifFalse: [ ^ true ].
	(self tree roots includesAll: self projectModel roots) ifFalse: [ ^ true ].
	(self projectModel roots includesAll: self tree roots) ifFalse: [ ^ true ].
	^ false
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
PyramidTreePresenter >> treeWithColumns [
	"return the tree with all columns in #columns added."

	self columns do: [ :each | tree addColumn: each ].
	^ tree
]

{ #category : #'as yet unclassified' }
PyramidTreePresenter >> updateRoots [

	self shouldUpdateSelection: false.
	[self tree roots: self projectModel roots asArray]ensure: [ self shouldUpdateSelection: true ]
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
	"Update tree: 
	- roots = projectModel roots
	- selection = projectModel selection
	- columns can change too"
]
