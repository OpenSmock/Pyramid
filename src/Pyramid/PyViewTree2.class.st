Class {
	#name : #PyViewTree2,
	#superclass : #PyViewAbstract,
	#traits : 'PyBlocInput + PyBlocOutput + PyBlocTakesRoot',
	#classTraits : 'PyBlocInput classTrait + PyBlocOutput classTrait + PyBlocTakesRoot classTrait',
	#instVars : [
		'tree',
		'toolbar'
	],
	#category : #'Pyramid-Editor-Views'
}

{ #category : #accessing }
PyViewTree2 >> addBall [

	| e |
	e := PyExamples test2 materializeAsBlElement.
	(e childAt: 1) background: Color random.
	self addElement: e
]

{ #category : #accessing }
PyViewTree2 >> addElement: aBlElement [

	| father |
	father := tree selectedItem.
	father addChild: aBlElement.

	self refreshTreeOn: father
]

{ #category : #accessing }
PyViewTree2 >> addRandom [

	| e |
	e := BlElement new
		     constraintsDo: [ :c | 
			     c horizontal exact: 50.
			     c vertical exact: 25.
			     c margin: (BlInsets
						      top: 10
						      right: 0
						      bottom: 0
						      left: 10) ];
		     yourself.
	e background: Color random.
	self addElement: e
]

{ #category : #accessing }
PyViewTree2 >> contextMenu [

	| menu |
	menu := SpMenuPresenter new.
	menu addGroup: [ :group | 
		group addItem: [ :item | 
			item
				name: 'add';
				action: [ self addRandom ];
				icon: (self iconNamed: #plus);
				yourself ].
		group addItem: [ :item | 
			item
				name: 'addBall';
				action: [ self addBall ];
				icon: (self iconNamed: #plus);
				yourself ].
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
	menu addGroup: [ :group | 
		group
			addItem: [ :item | 
				item
					name: 'Move on front';
					shortcut: $p ctrl;
					"action: self actionMoveUpBlock;"icon: (self iconNamed: #up);
					yourself ];
			addItem: [ :item | 
				item
					name: 'Move on back';
					shortcut: $m ctrl;
					"action: self actionMoveDownBlock;"icon: (self iconNamed: #down);
					yourself ] ].
	^ menu
]

{ #category : #layout }
PyViewTree2 >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #toolbar expand: false;
		  add: #tree expand: true;
		  yourself
]

{ #category : #initialization }
PyViewTree2 >> initializePresenters [

	tree := self newTree.
	toolbar := self initializeToolbar.

	SpTreeMultipleSelectionMode on: tree.

	tree
		beMultipleSelection;
		display: [ :each | each printString ];
		children: [ :each | each children ];
		contextMenu: [ self contextMenu ];
		expandRoots
]

{ #category : #initialization }
PyViewTree2 >> initializeToolbar [

	^ self newToolbar
		  beBoth;
		  add: (SpToolbarButtonPresenter new
				   icon: (self iconNamed: #top);
				   label: 'Move First';
				   action: [ self moveElementFirst ];
				   yourself);
		  add: (SpToolbarButtonPresenter new
				   icon: (self iconNamed: #up);
				   label: 'Move Up';
				   action: [ self moveElementUp ];
				   yourself);
		  add: (SpToolbarButtonPresenter new
				   icon: (self iconNamed: #down);
				   label: 'Move Down';
				   action: [ self moveElementDown ];
				   yourself);
		  add: (SpToolbarButtonPresenter new
				   icon: (self iconNamed: #bottom);
				   label: 'Move Last';
				   action: [ self moveElementLast ];
				   yourself);
		  addItemRight: (SpToolbarButtonPresenter new
				   icon: (self iconNamed: #glamorousRefresh);
				   label: 'Refresh';
				   action: [ self refreshTreeOn: tree selectedItem ];
				   yourself)
]

{ #category : #initialization }
PyViewTree2 >> moveElementDown [

	self moveElementTo: [ :path :father | 
		path last + 1 min: father children size ]
]

{ #category : #initialization }
PyViewTree2 >> moveElementFirst [

	self moveElementTo: [ :path :father | 1 ]
]

{ #category : #initialization }
PyViewTree2 >> moveElementLast [

	self moveElementTo: [ :path :father | father children size ]
]

{ #category : #initialization }
PyViewTree2 >> moveElementTo: aBlockTo [

	| path father child |
	path := tree selection selectedPath.
	child := tree selectedItem.

	path size <= 1 ifTrue: [ ^ self ].

	father := tree roots at: path first.
	path allButFirst allButLast do: [ :index | 
		father := father childAt: index ].

	father
		swapChildAt: path last
		with: (aBlockTo value: path value: father).

	self refreshTreeOn: child
]

{ #category : #initialization }
PyViewTree2 >> moveElementUp [

	self moveElementTo: [ :path :father | path last - 1 max: 1 ]
]

{ #category : #transmission }
PyViewTree2 >> outputSelectionPort [

	^ SpSelectionPort newPresenter: tree
]

{ #category : #accessing }
PyViewTree2 >> pageIcon [

	^ (self iconNamed: #catalog)
]

{ #category : #accessing }
PyViewTree2 >> pageTitle [

	^ 'Tree'
]

{ #category : #'as yet unclassified' }
PyViewTree2 >> receiveNewBlElement: aBlElement [

	self flag: #BUG. "Reference cyclique si plusieurs arbres."
	"aBlElement = tree selectedItem ifFalse: [ 
		self refreshTreeOn: aBlElement ]"
]

{ #category : #initialization }
PyViewTree2 >> refreshTree [

	self refreshTreeOn: tree selectedItem
]

{ #category : #initialization }
PyViewTree2 >> refreshTreeOn: aBlElement [

	tree
		roots: { self root };
		expandRoots;
		selectItem: aBlElement;
		yourself
]

{ #category : #'as yet unclassified' }
PyViewTree2 >> whenRootChanged [

	tree roots: { self root }
]
