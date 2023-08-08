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

{ #category : #'class initialization' }
PyramidTreePlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
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
		                 libraryPresenterForRoot: self libraryPresenterForRoot;
		                 yourself
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
					name: 'Add new root';
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
					icon: (self iconNamed: #add);
					action: [
						(PyramidPopoverFactory
							 makeWithPresenter: self libraryPresenterForElement
							 relativeTo: self treePresenter
							 position: SpPopoverPosition right) popup ] ].
			group addItem: [ :anItem |
				anItem
					name: 'Remove selection';
					icon: (self iconNamed: #delete);
					action: [ self removeSelection ] ] ]
		order: 10.

	aBuilder
		addGroupMultiSelection: [ :group :multi |
			group addItem: [ :anItem |
				anItem
					name: 'Remove selection';
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
