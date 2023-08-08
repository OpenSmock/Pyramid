Class {
	#name : #PyramidPluginHierarchyIncubator,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'view',
		'editor'
	],
	#category : #'Pyramid-Incubator-plugin-hierarchy-selection-helper'
}

{ #category : #initialization }
PyramidPluginHierarchyIncubator class >> install [

	<script>
	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #testing }
PyramidPluginHierarchyIncubator class >> isInstalled [

	^ PyramidPluginManager uniqueInstance isPluginInstalled: self
]

{ #category : #initialization }
PyramidPluginHierarchyIncubator class >> uninstall [

	<script>
	PyramidPluginManager uniqueInstance removePlugin: self
]

{ #category : #adding }
PyramidPluginHierarchyIncubator >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabLeft addItem: [ :builder |
		builder
			makeTab: self view
			label: 'Tree'
			icon: (self iconNamed: #catalog)
			order: 1 ].
	aPyramidSimpleWindow
		at: #selectionMenu
		addItem: [ :builder | self menuAddAndDeleteOn: builder ]
]

{ #category : #'as yet unclassified' }
PyramidPluginHierarchyIncubator >> connectOn: aPyramidEditor [

	self editor: aPyramidEditor.
	self view connectOn: aPyramidEditor
]

{ #category : #accessing }
PyramidPluginHierarchyIncubator >> editor [

	^ editor
]

{ #category : #accessing }
PyramidPluginHierarchyIncubator >> editor: anObject [

	editor := anObject
]

{ #category : #initialization }
PyramidPluginHierarchyIncubator >> initialize [

	view := PyramidHierarchyPresenterIncubator new
]

{ #category : #'as yet unclassified' }
PyramidPluginHierarchyIncubator >> menuAddAndDeleteOn: aBuilder [

	aBuilder
		addGroupEmptySelection: [ :group :empty |
			group addItem: [ :anItem |
				anItem
					name: 'Add new root';
					icon: (self iconNamed: #add);
					action: [
						(PyramidPopoverFactory
							 makeWithPresenter: (PyramidLibraryPresenterForRoot new
									  editor: self editor;
									  yourself)
							 relativeTo: self view
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
							 makeWithPresenter: (PyramidLibraryPresenterForElement new
									  editor: self editor;
									  yourself)
							 relativeTo: self view
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
PyramidPluginHierarchyIncubator >> removeSelection [

	self editor propertiesManager commandExecutor
		use: PyramidRemoveSelectionCommand new
		on: self editor projectModel selection
		with: self editor projectModel roots
]

{ #category : #initialization }
PyramidPluginHierarchyIncubator >> view [

	^ view
]
