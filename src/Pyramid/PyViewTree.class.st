Class {
	#name : #PyViewTree,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelLeft',
	#classTraits : 'TPyEditorPanelLeft classTrait',
	#instVars : [
		'tree'
	],
	#category : #'Pyramid-Editor-Side-Panel'
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
	business selection addObserver: self
]

{ #category : #api }
PyViewTree >> contextMenu [
	^ SpMenuPresenter new addGroup: [ :group |
					group addItem: [ :item | item name: tree selectedItem asString ] ]
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
		children: [ :anElement | anElement children ];
		"displayIcon: [ :anElement | self iconNamed: aClass systemIconName ];"
		display: [ :anElement | anElement printString ];
		contextMenu: [ self contextMenu ].

	self selectionChangedActivate
]

{ #category : #'as yet unclassified' }
PyViewTree >> pySelectionChanged [

	self selectionChangedDesactivate.
	self tree whenSelectionChangedDo: [ :selection |  ].
	self tree selectItems: self selection elements.
	self selectionChangedActivate
]

{ #category : #accessing }
PyViewTree >> roots [

	^ { BlElement new . BlElement new . BlElement new . BlElement new }
]

{ #category : #accessing }
PyViewTree >> selection [

	^ business selection
]

{ #category : #'as yet unclassified' }
PyViewTree >> selectionChangedActivate [.
	self tree whenSelectionChangedDo: [ :selection |
		self selectionChangedFromTree: selection ]
]

{ #category : #'as yet unclassified' }
PyViewTree >> selectionChangedDesactivate [.
	self tree whenSelectionChangedDo: [ :selection |  ].
]

{ #category : #'event handling' }
PyViewTree >> selectionChangedFromTree: aSelection [

	self selection removeObserver: self.
	self selection clearThenAddAll: aSelection selectedItems.
	self selection addObserver: self
]

{ #category : #accessing }
PyViewTree >> tree [
	^ tree
]
