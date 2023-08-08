Class {
	#name : #PyramidTreePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'treePresenter',
		'editor',
		'libraryPresenterForElement',
		'libraryPresenterForRoot'
	],
	#category : #'Pyramid-Bloc-plugin-tree-library'
}

{ #category : #'as yet unclassified' }
PyramidTreePlugin class >> columnNameAndType: aPyramidTreePlugin [

	^ SpCompositeTableColumn new
		  sortFunction: PyramidElementIdSortFunction new;
		  title: 'Elements';
		  addColumn:
			  (SpImageTableColumn evaluated: [ :aBlElement | aBlElement asIcon ]);
		  addColumn: (SpStringTableColumn new
				   title: 'Class';
				   evaluated: [ :aBlElement | aBlElement class name ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Identity';
				   evaluated: [ :aBlElement | aBlElement identityHash printString ];
				   displayColor: [ :aBlElement | Color gray ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Identifier';
				   beEditable;
				   onAcceptEdition: [ :aBlElement :newIdString |
					   self
						   setId: newIdString
						   of: aBlElement
						   onEditor: aPyramidTreePlugin editor ];
				   evaluated: [ :aBlElement |
					   aBlElement id isNoId
						   ifTrue: [ '' ]
						   ifFalse: [ aBlElement id asSymbol ] ];
				   displayColor: [ :aBlElement | Smalltalk ui theme textColor ];
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidTreePlugin class >> columnVisibility: aPyramidTreePlugin [

	^ SpCompositeTableColumn new
		  title: 'Visibility';
		sortFunction: PyramidVisibilitySortFunction new;
		  width: 80;
		  addColumn: (SpImageTableColumn evaluated: [ :aBlElement |
					   aBlElement
						   allParentsDetect: [ :parent | parent isVisible not ]
						   ifFound: [ :parent | self iconNamed: #uncommentedClass ]
						   ifNone: [ self iconNamed: #blank16 ] ]);
		  addColumn: (SpImageTableColumn evaluated: [ :aBlElement |
					   aBlElement visibility asIcon ]);
		  addColumn: (SpLinkTableColumn new
				   title: 'Visible';
				   url: [ :aBlElement | '' ];
				   action: [ :aBlElement |
					   self
						   setVisibility: aBlElement visibility nextVisibilityForTree
						   of: aBlElement
						   onEditor: aPyramidTreePlugin editor ];
				   evaluated: [ :aBlElement | aBlElement visibility asString ];
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidTreePlugin class >> columnZIndex: aPyramidTreePlugin [

	^ SpStringTableColumn new
		  title: 'z';
		  sortFunction: PyramidElevationSortFunction new;
		evaluated: [ :aBlElement | aBlElement elevation elevation printString ];
		  width: 20;
		  yourself
]

{ #category : #'class initialization' }
PyramidTreePlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #initialization }
PyramidTreePlugin class >> setId: aString of: aBlElement onEditor: aPyramidEditor [

	aPyramidEditor propertiesManager commandExecutor
		use: PyramidElementIdCommand new
		on: { aBlElement }
		with: aString
]

{ #category : #initialization }
PyramidTreePlugin class >> setVisibility: aBlVisibility of: aBlElement onEditor: aPyramidEditor [

	aPyramidEditor propertiesManager commandExecutor
		use: PyramidVisibilityCommand new
		on: { aBlElement }
		with: aBlVisibility
]

{ #category : #adding }
PyramidTreePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabLeft addItem: [ :builder |
		builder
			makeTab: self treePresenter
			label: 'Tree'
			icon: (self iconNamed: #catalog)
			order: 1 ].

	aPyramidSimpleWindow
		at: #selectionMenu
		addItem: [ :builder | self menuAddAndDeleteOn: builder ]
]

{ #category : #'as yet unclassified' }
PyramidTreePlugin >> connectOn: aPyramidEditor [

	self editor: aPyramidEditor.
	self treePresenter projectModel: aPyramidEditor projectModel.
	self treePresenter editorMenuBuilder:
		(self editor window services at: #selectionMenu) builder
]

{ #category : #accessing }
PyramidTreePlugin >> editor [

	^ editor
]

{ #category : #accessing }
PyramidTreePlugin >> editor: anObject [

	editor := anObject.
	self libraryPresenterForElement editor: anObject.
	self libraryPresenterForRoot editor: anObject.
]

{ #category : #initialization }
PyramidTreePlugin >> initialize [

	self initializeLibraryPresenters.
	treePresenter := PyramidTreePresenter new
		                 libraryPresenterForRoot:
			                 self libraryPresenterForRoot;
		                 yourself.
	self initializeTreeColumns.
]

{ #category : #initialization }
PyramidTreePlugin >> initializeLibraryPresenters [

	| idGenerator |
	idGenerator :=  PyramidLibraryPresenter idGenerator.
	libraryPresenterForElement := PyramidLibraryPresenterForElement new
		                              editor: self editor;
		idGenerator: idGenerator;
		                              yourself.
	libraryPresenterForRoot := PyramidLibraryPresenterForRoot new
		                           editor: self editor;
		idGenerator: idGenerator;
		                           yourself
]

{ #category : #initialization }
PyramidTreePlugin >> initializeTreeColumns [

	self treePresenter columns add: (self class columnNameAndType: self).
	self treePresenter columns add: (self class columnZIndex: self).
	self treePresenter columns add: (self class columnVisibility: self).
	self treePresenter updateTree
]

{ #category : #'as yet unclassified' }
PyramidTreePlugin >> libraryPresenterForElement [

	^ libraryPresenterForElement
]

{ #category : #'as yet unclassified' }
PyramidTreePlugin >> libraryPresenterForRoot [

	^ libraryPresenterForRoot
]

{ #category : #'as yet unclassified' }
PyramidTreePlugin >> menuAddAndDeleteOn: aBuilder [

	aBuilder
		addGroupEmptySelection: [ :group :empty |
			group addItem: [ :anItem |
				anItem
					name: 'Add new element';
					help: 'Add a new element on the roots of the design.';
					icon: (self iconNamed: #add);
					action: [
						(PyramidPopoverFactory
							 makeWithPresenter: self libraryPresenterForRoot
							 relativeTo: self treePresenter
							 position: SpPopoverPosition right) popup ] ] ]
		order: 10.

	aBuilder
		addGroupSingleSelection: [ :group :single |
			group addItem: [ :anItem |
				anItem
					name: 'Add new element';
					help: 'Add a new element as a child of the selected element.';
					icon: (self iconNamed: #add);
					action: [
						(PyramidPopoverFactory
							 makeWithPresenter: self libraryPresenterForElement
							 relativeTo: self treePresenter
							 position: SpPopoverPosition right) popup ] ].
			group addItem: [ :anItem |
				anItem
					name: 'Remove selection';
					help:
						'Delete the selected element and its children from the design.';
					icon: (self iconNamed: #delete);
					action: [ self removeSelection ] ] ]
		order: 10.

	aBuilder
		addGroupMultiSelection: [ :group :multi |
			group addItem: [ :anItem |
				anItem
					name: 'Remove selection';
					help:
						'Delete all selected elements and their children from the design.';
					icon: (self iconNamed: #delete);
					action: [ self removeSelection ] ] ]
		order: 10
]

{ #category : #removing }
PyramidTreePlugin >> removeSelection [

	self editor propertiesManager commandExecutor
		use: PyramidRemoveSelectionCommand new
		on: self editor projectModel selection
		with: self editor projectModel roots
]

{ #category : #accessing }
PyramidTreePlugin >> treePresenter [

	^ treePresenter
]
