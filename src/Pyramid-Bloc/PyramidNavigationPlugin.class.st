Class {
	#name : #PyramidNavigationPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'navigation',
		'editor'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #adding }
PyramidNavigationPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabLeft addItem: [ :builder |
		builder
			makeTab: self navigation
			label: 'Navigation'
			icon: (Smalltalk ui icons iconNamed: #catalog)
			order: 2 ].

	aPyramidSimpleWindow
		at: #selectionMenu
		addItem: [ :builder | self menuAddAndDeleteOn: builder ]
]

{ #category : #connecting }
PyramidNavigationPlugin >> connectOn: aPyramidEditor [

	editor := aPyramidEditor.
	self navigation editor: aPyramidEditor.
	self libraryController popoverOrigin:
		(aPyramidEditor window services at: #tabLeft) presenter.
]

{ #category : #initialization }
PyramidNavigationPlugin >> editor [

	^ editor
]

{ #category : #initialization }
PyramidNavigationPlugin >> initialize [

	super initialize.
	navigation := PyramidNavigationPresenter new.
]

{ #category : #accessing }
PyramidNavigationPlugin >> libraryController [

	^ self navigation library libraryController
]

{ #category : #'as yet unclassified' }
PyramidNavigationPlugin >> menuAddAndDeleteOn: aBuilder [

	aBuilder
		addGroupEmptySelection: [ :group :empty |
			group addItem: [ :anItem |
				anItem
					name: 'Add element...';
					help: 'Add a new element on the roots of the design.';
					icon: (Smalltalk ui icons iconNamed: #add);
					action: [ self libraryController openForRoot ] ] ]
		order: 10.

	aBuilder
		addGroupSingleSelection: [ :group :single |
			group addItem: [ :anItem |
				anItem
					name: 'Add child element...';
					help: 'Add a new element as a child of the selected element.';
					icon: (Smalltalk ui icons iconNamed: #add);
					action: [ self libraryController openForSelection ] ].
			group addItem: [ :anItem |
				anItem
					name: 'Remove element';
					help: 'Delete the selected element and its content';
					icon: (Smalltalk ui icons iconNamed: #delete);
					action: [ self removeSelectedElements ] ] ]
		order: 10.

	aBuilder
		addGroupMultiSelection: [ :group :multi |
			group addItem: [ :anItem |
				anItem
					name: 'Remove selection';
					help: 'Delete all selected elements and their contents';
					icon: (Smalltalk ui icons iconNamed: #delete);
					action: [ self removeSelectedElements ] ] ]
		order: 10
]

{ #category : #initialization }
PyramidNavigationPlugin >> navigation [

	^ navigation
]

{ #category : #removing }
PyramidNavigationPlugin >> removeSelectedElements [

	self editor commandExecutor
		use: PyramidRemoveSelectedElementsCommand new
		on: self editor projectModel selection
		with: self editor projectModel firstLevelElements.

	"Update the selection after remove"
	self editor projectModel updateSelection
]
