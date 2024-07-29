Class {
	#name : #PyramidTreePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidElementToAdd',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidElementToAdd classTrait',
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

{ #category : #'as yet unclassified' }
PyramidTreePlugin class >> addDefaultOnLibrary: library [

	| factoryElement factoryTextElement |

	factoryElement := PyramidElementToAddFactory new
				             elementIcon:
					             (Smalltalk ui icons iconNamed: #class);
				             elementName: 'Simple Element';
				             elementBlock: [ {BlElement new background: Color random; yourself} ];
				             yourself.
	factoryTextElement := PyramidElementToAddFactory new
				             elementIcon:
					             (Smalltalk ui icons iconNamed: #haloFontSize);
				             elementName: 'Simple Element';
				             elementBlock: [ {BlTextElement new text: 'Change me' asRopedText; yourself} ];
				             yourself.

	library
		addCategoryWithName: '(Default)'
		withIcon: (Smalltalk ui icons iconNamed: #box)
		withAllFactories: { factoryElement . factoryTextElement } sorted.

	^ library
]

{ #category : #adding }
PyramidTreePlugin class >> addOnLibrary: aLibrary [

	self addDefaultOnLibrary: aLibrary.
	self addPystonOnLibrary: aLibrary.
	self addPystashOnLibrary: aLibrary
]

{ #category : #'as yet unclassified' }
PyramidTreePlugin class >> addPragma: aSymbol onLibrary: aLibrary withIcon: anIcon [

	| pragmas methods packages |
	pragmas := Pragma allNamed: aSymbol.
	methods := (pragmas collect: #method) asSet.
	packages := (methods collect: #package) asSet.

	packages do: [ :package |
		| factories |
		package ifNotNil: [ factories := methods
			             select: [ :method | method package = package ]
			             thenCollect: [ :method |
				             PyramidElementToAddFactory new
					             elementIcon: (Smalltalk ui icons iconNamed:
								              method methodClass soleInstance systemIconName);
					             elementName: method selector;
					             elementBlock: [
						             (method methodClass soleInstance perform:
								              method selector) materializeAsBlElement ];
					             yourself ].
		aLibrary
			addCategoryWithName: package name
			withIcon: anIcon
			withAllFactories: factories asArray sorted ]
		].

	^ aLibrary
]

{ #category : #'as yet unclassified' }
PyramidTreePlugin class >> addPystashOnLibrary: library [

	^ self
		  addPragma: #pyStash
		  onLibrary: library
		  withIcon: (Smalltalk ui icons iconNamed: #smallSave).
]

{ #category : #'as yet unclassified' }
PyramidTreePlugin class >> addPystonOnLibrary: library [

	^ self
		  addPragma: #pySTON
		  onLibrary: library
		  withIcon: (Smalltalk ui icons iconNamed: #smallSave)
]

{ #category : #accessing }
PyramidTreePlugin class >> columnsBuildersClasses [

	ColumnsBuildersClasses ifNil: [
		ColumnsBuildersClasses := Set new ].
	^ ColumnsBuildersClasses
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
			icon: (Smalltalk ui icons iconNamed: #catalog)
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
	idGenerator := PyramidLibraryContainerPresenter makeIdGenerator.
	libraryPresenterForElement := PyramidLibraryContainerPresenter new
		                              idGenerator: idGenerator;
		                              library: PyramidElementToAddPresenter new;
		                              buttonLabel: 'Add new child';
		                              buttonAction: [
			                              self editor propertiesManager
				                              commandExecutor
				                              use: PyramidAddChildrenCommand new
				                              on:
					                              self editor projectModel selection
				                              with:
					                              libraryPresenterForElement
						                              elementToAdd ];
		                              yourself.
	libraryPresenterForRoot := PyramidLibraryContainerPresenter new
		                           idGenerator: idGenerator;
		                           library: PyramidElementToAddPresenter new;
		                           buttonLabel: 'Add new on first level';
		                           buttonAction: [
			                           self editor propertiesManager
				                           commandExecutor
				                           use:
					                           PyramidAddAllToCollectionCommand new
				                           on:
					                           { self editor projectModel
						                           firstLevelElements }
				                           with:
					                           libraryPresenterForRoot elementToAdd ];
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
					icon: (Smalltalk ui icons iconNamed: #add);
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
					icon: (Smalltalk ui icons iconNamed: #add);
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
					icon: (Smalltalk ui icons iconNamed: #delete);
					action: [ self removeSelectedElements ] ] ]
		order: 10.

	aBuilder
		addGroupMultiSelection: [ :group :multi |
			group addItem: [ :anItem |
				anItem
					name: 'Remove selection';
					help:
						'Delete all selected elements and their contents';
					icon: (Smalltalk ui icons iconNamed: #delete);
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
