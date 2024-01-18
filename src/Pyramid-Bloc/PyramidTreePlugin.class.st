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
	#classVars : [
		'ColumnsBuildersClasses'
	],
	#category : #'Pyramid-Bloc-plugin-tree-library'
}

{ #category : #accessing }
PyramidTreePlugin class >> columnsBuildersClasses [

	ColumnsBuildersClasses ifNil: [
		ColumnsBuildersClasses := Set new ].
	^ ColumnsBuildersClasses
]

{ #category : #'meta-data' }
PyramidTreePlugin class >> dependencies [
	"Put symbol as the class name for each dependencies."

	^ { #PyramidBlocPlugin }
]

{ #category : #initialization }
PyramidTreePlugin class >> install [
	"Do some stuff here when the plugin used class oriented behavior"

	self columnsBuildersClasses add: PyramidTreeBaseColumnsBuilder 
]

{ #category : #initialization }
PyramidTreePlugin >> addColumns: aCollection [
	aCollection do: [ :each | self treePresenter columns add: each ].
	self treePresenter updateTree

	
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

{ #category : #actions }
PyramidTreePlugin >> configureBuilder: aPyramidEditorBuilder [

	self class columnsBuildersClasses do: [ :each |
		each new
			editor: aPyramidEditorBuilder editor;
			buildOn: self ]
]

{ #category : #connecting }
PyramidTreePlugin >> connectOn: aPyramidEditor [

	self editor: aPyramidEditor.
]

{ #category : #accessing }
PyramidTreePlugin >> editor [

	^ editor
]

{ #category : #accessing }
PyramidTreePlugin >> editor: aPyramidEditor [

	editor := aPyramidEditor.
	self libraryPresenterForElement editor: aPyramidEditor.
	self libraryPresenterForRoot editor: aPyramidEditor.
	self treePresenter projectModel: aPyramidEditor projectModel.
	self treePresenter editorMenuBuilder:
		(self editor window services at: #selectionMenu) builder
]

{ #category : #initialization }
PyramidTreePlugin >> initialize [

	self initializeLibraryPresenters.
	treePresenter := PyramidTreePresenter new
		                 libraryPresenterForRoot:
			                 self libraryPresenterForRoot;
		                 yourself
]

{ #category : #initialization }
PyramidTreePlugin >> initializeLibraryPresenters [

	| idGenerator |
	idGenerator := PyramidLibraryPresenter makeIdGenerator.
	libraryPresenterForElement := PyramidLibraryPresenterForElement new
		                              editor: self editor;
		                              idGenerator: idGenerator;
		                              yourself.
	libraryPresenterForRoot := PyramidLibraryPresenterForFirstLevelElement
		                           new
		                           editor: self editor;
		                           idGenerator: idGenerator;
		                           yourself
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
					name: 'Add element...';
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
					name: 'Add child element...';
					help: 'Add a new element as a child of the selected element.';
					icon: (self iconNamed: #add);
					action: [
						(PyramidPopoverFactory
							 makeWithPresenter: self libraryPresenterForElement
							 relativeTo: self treePresenter
							 position: SpPopoverPosition right) popup ] ].
			group addItem: [ :anItem |
				anItem
					name: 'Remove element';
					help:
						'Delete the selected element and its content';
					icon: (self iconNamed: #delete);
					action: [ self removeSelectedElements ] ] ]
		order: 10.

	aBuilder
		addGroupMultiSelection: [ :group :multi |
			group addItem: [ :anItem |
				anItem
					name: 'Remove selection';
					help:
						'Delete all selected elements and their contents';
					icon: (self iconNamed: #delete);
					action: [ self removeSelectedElements ] ] ]
		order: 10
]

{ #category : #removing }
PyramidTreePlugin >> removeSelectedElements [

	self editor propertiesManager commandExecutor
		use: PyramidRemoveSelectedElementsCommand new
		on: self editor projectModel selection
		with: self editor projectModel firstLevelElements.

	"Update the selection after remove"
	self editor projectModel updateSelection
]

{ #category : #accessing }
PyramidTreePlugin >> treePresenter [

	^ treePresenter
]
