Class {
	#name : #PyramidPluginHierarchy,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'view',
		'editor'
	],
	#category : #'Pyramid-Bloc-plugin-hierarchy'
}

{ #category : #initialization }
PyramidPluginHierarchy class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidPluginHierarchy >> addPanelsOn: aPyramidSimpleWindow [

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
PyramidPluginHierarchy >> connectOn: aPyramidEditor [

	self editor: aPyramidEditor.
	self view connectOn: aPyramidEditor
]

{ #category : #accessing }
PyramidPluginHierarchy >> editor [

	^ editor
]

{ #category : #accessing }
PyramidPluginHierarchy >> editor: anObject [

	editor := anObject
]

{ #category : #initialization }
PyramidPluginHierarchy >> initialize [

	view := PyramidHierarchyPresenter new
]

{ #category : #'as yet unclassified' }
PyramidPluginHierarchy >> menuAddAndDeleteOn: aBuilder [

	aBuilder addGroupEmptySelection: [ :group :empty |
		group addItem: [ :anItem |
			anItem
				name: 'Add new root';
				icon: (self iconNamed: #add);
				action: [
					(PyramidPopoverFactory
						 makeWithPresenter: (PyramidLibraryViewForRoot new
								  editor: self editor;
								  yourself)
						 relativeTo: self view
						 position: SpPopoverPosition right) popup ] ] ] order: 10.

	aBuilder addGroupSingleSelection: [ :group :single |
		group addItem: [ :anItem |
			anItem
				name: 'Add new element';
				icon: (self iconNamed: #add);
				action: [
					(PyramidPopoverFactory
						 makeWithPresenter: (PyramidLibraryViewForElement new
								  editor: self editor;
								  yourself)
						 relativeTo: self view
						 position: SpPopoverPosition right) popup ] ].
		group addItem: [ :anItem |
			anItem
				name: 'Remove selection';
				icon: (self iconNamed: #delete);
				action: [ self editor projectModel removeSelection ] ] ] order: 10.

	aBuilder addGroupMultiSelection: [ :group :multi |
		group addItem: [ :anItem |
			anItem
				name: 'Add new element';
				icon: (self iconNamed: #add);
				action: [
					(PyramidPopoverFactory
						 makeWithPresenter: (PyramidLibraryViewForElement new
								  editor: self editor;
								  yourself)
						 relativeTo: self view
						 position: SpPopoverPosition right) popup ] ].
		group addItem: [ :anItem |
			anItem
				name: 'Remove selection';
				icon: (self iconNamed: #delete);
				action: [ self editor projectModel removeSelection ] ] ] order: 10
]

{ #category : #initialization }
PyramidPluginHierarchy >> view [

	^ view
]
