Class {
	#name : #PyViewTree,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelLeft + TPySelectionObserver',
	#classTraits : 'TPyEditorPanelLeft classTrait + TPySelectionObserver classTrait',
	#instVars : [
		'tree'
	],
	#category : #'Pyramid-Editor-Panels-Side'
}

{ #category : #accessing }
PyViewTree class >> pageIcon [

	^ self iconNamed: #catalog
]

{ #category : #accessing }
PyViewTree class >> pageTitle [

	^ 'Tree'
]

{ #category : #initialization }
PyViewTree >> business: aBusiness [

	business := aBusiness.
	self roots: business roots.
	self selection: aBusiness selection
]

{ #category : #accessing }
PyViewTree >> contextMenu [

	| menu |
	menu := SpMenuPresenter new.
	menu addGroup: [ :group |
		group addItem: [ :item |
			item
				name: 'inspect';
				action: [ tree selectedItem inspect ];
				icon: (self iconNamed: #glamorousInspect);
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
PyViewTree >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #tree expand: true;
		  yourself
]

{ #category : #initialization }
PyViewTree >> initializePresenters [

	tree := self newTree.
	tree
		beMultipleSelection;
		roots: self roots;
		display: [ :each | each printString ];
		children: [ :each | each children ];
		contextMenu: [ self contextMenu ];
		expandRoots.

	self selectionChangedActivate
]

{ #category : #accessing }
PyViewTree >> order [

	^ 1
]

{ #category : #'as yet unclassified' }
PyViewTree >> pySelectionChanged [

	self selectionChangedDesactivate.
	self tree selectItems: self selection elements.
	self tree refresh.
	self selectionChangedActivate
]

{ #category : #accessing }
PyViewTree >> roots [

	self business ifNil: [ ^ {  } ].
	^ self business roots elements
]

{ #category : #api }
PyViewTree >> roots: aPyRoots [

	self tree roots: aPyRoots elements
]

{ #category : #'as yet unclassified' }
PyViewTree >> selectionChangedActivate [

	self tree whenSelectionChangedDo: [ :selection |
		self selection removeObserver: self.
		self selection clearThenAddAll: selection selectedItems.
		self selection addObserver: self. ]
]

{ #category : #'as yet unclassified' }
PyViewTree >> selectionChangedDesactivate [

	self tree whenSelectionChangedDo: [ :selection |  ].
]

{ #category : #accessing }
PyViewTree >> tree [
	^ tree
]
