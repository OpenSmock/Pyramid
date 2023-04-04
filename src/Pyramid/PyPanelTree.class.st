Class {
	#name : #PyPanelTree,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelLeft + TPySelectionObserver + TPyPipelineObserver',
	#classTraits : 'TPyEditorPanelLeft classTrait + TPySelectionObserver classTrait + TPyPipelineObserver classTrait',
	#instVars : [
		'tree',
		'columns'
	],
	#category : #'Pyramid-Editor-Tree'
}

{ #category : #accessing }
PyPanelTree class >> pageIcon [

	^ self iconNamed: #catalog
]

{ #category : #accessing }
PyPanelTree class >> pageTitle [

	^ 'Tree'
]

{ #category : #initialization }
PyPanelTree >> business: aBusiness [

	business := aBusiness.
	self roots: business roots.
	self selection: aBusiness selection.
	self pipeline: aBusiness pipeline.
	self columns do: [ :each | each business: aBusiness ]
]

{ #category : #accessing }
PyPanelTree >> columns [

	columns ifNil: [
		columns := (PyEditorPanelLocator classPanelTreeColumns collect: [
			               :each | each new ]) asArray sorted ].
	^ columns
]

{ #category : #accessing }
PyPanelTree >> contextMenu [

	| menu |
	menu := SpMenuPresenter new.
	menu addGroup: [ :group |
		group addItem: [ :item |
			item
				name: 'inspect';
				action: [ tree selectedItem inspect ];
				icon: (self iconNamed: #glamorousInspect);
				yourself ].
			group addItem: [ :item |
			item
				name: 'open in other editor';
				action: [ tree selectedItem openEditor ];
				icon: (self iconNamed: #glamorousSaveToUrl);
				yourself ] ].
	menu addGroup: [ :group |
		group addItem: [ :item |
			item
				name: 'Copy shape';
				shortcut: $c ctrl;
				icon: (self iconNamed: #smallCopy);
				yourself ].
		group addItem: [ :item |
			item
				name: 'Export as png';
				icon: (self iconNamed: #smallScreenshot);
				yourself ] ].
	^ menu
]

{ #category : #layout }
PyPanelTree >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #tree expand: true;
		  yourself
]

{ #category : #initialization }
PyPanelTree >> initializePresenters [

	tree := self newTreeTable.
	tree
		beMultipleSelection;
		beResizable;
		roots: self roots;
		children: [ :each | each children ];
		contextMenu: [ self contextMenu ];
		expandRoots.
	self columns do: [ :each | tree addColumn: each column ].
	self tree whenSelectionChangedDo: [ :newSelection |
		self selection removeObserver: self.
		self selection clearThenAddAll: newSelection selectedItems.
		self selection addObserver: self ]
]

{ #category : #accessing }
PyPanelTree >> order [

	^ 1
]

{ #category : #'as yet unclassified' }
PyPanelTree >> pyPipelineCancelCommand [
]

{ #category : #'as yet unclassified' }
PyPanelTree >> pyPipelineExecuteCommand [

	self tree disableActivationDuring: [ self tree refresh ]
]

{ #category : #'as yet unclassified' }
PyPanelTree >> pyPipelineTerminateCommand [
]

{ #category : #'as yet unclassified' }
PyPanelTree >> pyPipelineVerifyCommand [
]

{ #category : #'as yet unclassified' }
PyPanelTree >> pySelectionChanged [

	self tree disableActivationDuring: [self tree selectItems: self selection elements.
	self tree refresh. ]
]

{ #category : #accessing }
PyPanelTree >> roots [

	self business ifNil: [ ^ {  } ].
	^ self business roots elements
]

{ #category : #api }
PyPanelTree >> roots: aPyRoots [

	self tree roots: aPyRoots elements
]

{ #category : #accessing }
PyPanelTree >> tree [
	^ tree
]
