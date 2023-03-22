Class {
	#name : #PyViewTreeDeprecated,
	#superclass : #PyViewAbstract,
	#traits : 'PyBlocInput + PyBlocOutput + PyBlocTakesRoot',
	#classTraits : 'PyBlocInput classTrait + PyBlocOutput classTrait + PyBlocTakesRoot classTrait',
	#instVars : [
		'tree',
		'toolbar'
	],
	#category : #'Pyramid-ZZZ-Deprecated'
}

{ #category : #accessing }
PyViewTreeDeprecated >> addBall [

	| e |
	e := PyExamples test2 materializeAsBlElement.
	(e childAt: 1) background: Color random.
	self addElement: e
]

{ #category : #accessing }
PyViewTreeDeprecated >> addElement: aBlElement [

	| father |
	father := tree selectedItem.
	father addChild: aBlElement.

	self refreshTreeOn: father
]

{ #category : #accessing }
PyViewTreeDeprecated >> addRandom [

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
PyViewTreeDeprecated >> contextMenu [

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
PyViewTreeDeprecated >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #toolbar expand: false;
		  add: #tree expand: true;
		  yourself
]

{ #category : #initialization }
PyViewTreeDeprecated >> initializePresenters [

	tree := self newTree.
	toolbar := self initializeToolbar.

	SpTreeMultipleSelectionMode on: tree.

	tree
		display: [ :each | each printString ];
		children: [ :each | each children ];
		contextMenu: [ self contextMenu ];
		expandRoots
]

{ #category : #initialization }
PyViewTreeDeprecated >> initializeToolbar [

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
PyViewTreeDeprecated >> moveElementDown [

	self moveElementTo: [ :path :father | 
		path last + 1 min: father children size ]
]

{ #category : #initialization }
PyViewTreeDeprecated >> moveElementFirst [

	self moveElementTo: [ :path :father | 1 ]
]

{ #category : #initialization }
PyViewTreeDeprecated >> moveElementLast [

	self moveElementTo: [ :path :father | father children size ]
]

{ #category : #initialization }
PyViewTreeDeprecated >> moveElementTo: aBlockTo [

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
PyViewTreeDeprecated >> moveElementUp [

	self moveElementTo: [ :path :father | path last - 1 max: 1 ]
]

{ #category : #transmission }
PyViewTreeDeprecated >> outputSelectionPort [

	^ SpSelectionPort newPresenter: tree
]

{ #category : #accessing }
PyViewTreeDeprecated >> pageIcon [

	^ (self iconNamed: #catalog)
]

{ #category : #accessing }
PyViewTreeDeprecated >> pageTitle [

	^ 'Tree'
]

{ #category : #'as yet unclassified' }
PyViewTreeDeprecated >> receiveNewBlElement: aBlElement [

	self flag: #BUG. "Reference cyclique si plusieurs arbres."
	"aBlElement = tree selectedItem ifFalse: [ 
		self refreshTreeOn: aBlElement ]"
]

{ #category : #initialization }
PyViewTreeDeprecated >> refreshTree [

	self refreshTreeOn: tree selectedItem
]

{ #category : #initialization }
PyViewTreeDeprecated >> refreshTreeOn: aBlElement [

	tree
		roots: { self root };
		expandRoots;
		selectItem: aBlElement;
		yourself
]

{ #category : #'as yet unclassified' }
PyViewTreeDeprecated >> whenRootChanged [

	tree roots: { self root }
]
