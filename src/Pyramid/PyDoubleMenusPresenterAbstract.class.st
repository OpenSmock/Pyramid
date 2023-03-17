Class {
	#name : #PyDoubleMenusPresenterAbstract,
	#superclass : #PyEditorPresenterAbstract,
	#instVars : [
		'openMenu',
		'presenterCenter',
		'presenterLeft',
		'presenterRight',
		'toolbar',
		'root',
		'toolbarSave',
		'views'
	],
	#category : #'Pyramid-Editor'
}

{ #category : #testing }
PyDoubleMenusPresenterAbstract class >> isAbstract [

	^ self == PyDoubleMenusPresenterAbstract
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenterAbstract >> changeMenuLeft [

	openMenu at: 1 put: (openMenu at: 1) not.
	self layout: self defaultLayout
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenterAbstract >> changeMenuRight [

	openMenu at: 2 put: (openMenu at: 2) not.
	self layout: self defaultLayout
]

{ #category : #initialization }
PyDoubleMenusPresenterAbstract >> createNoteBookWith: aPyMenuCollection [

	| notebook |
	notebook := SpNotebookPresenter new.
	aPyMenuCollection do: [ :menu | 
		notebook addPage: menu asNotebookPage ].

	^ notebook
]

{ #category : #layout }
PyDoubleMenusPresenterAbstract >> defaultLayout [

	self isOpenLeftAndRight ifTrue: [ ^ self defaultLayoutLeftAndRight ].
	self isOpenRight ifTrue: [ ^ self defaultLayoutRight ].
	self isOpenLeft ifTrue: [ ^ self defaultLayoutLeft ].
	^ self defaultLayoutCenter
]

{ #category : #layout }
PyDoubleMenusPresenterAbstract >> defaultLayoutCenter [

	^ self makeLayout: presenterCenter
]

{ #category : #layout }
PyDoubleMenusPresenterAbstract >> defaultLayoutLeft [

	| mainPanel |
	mainPanel := SpPanedLayout newLeftToRight
		             positionOfSlider: 0.2;
		             add: presenterLeft;
		             add: presenterCenter;
		             yourself.

	^ self makeLayout: mainPanel
]

{ #category : #layout }
PyDoubleMenusPresenterAbstract >> defaultLayoutLeftAndRight [

	| mainPanel |
	mainPanel := SpPanedLayout newLeftToRight
		             positionOfSlider: 0.2;
		             add: presenterLeft;
		             add: (SpPanedLayout newLeftToRight
		             positionOfSlider: 0.75;
		             add: presenterCenter;
		             add: presenterRight;
		             yourself);
		             yourself.

	^ self makeLayout: mainPanel
]

{ #category : #layout }
PyDoubleMenusPresenterAbstract >> defaultLayoutRight [

	| mainPanel |
	mainPanel := SpPanedLayout newLeftToRight
		             positionOfSlider: 0.8;
		             add: presenterCenter;
		             add: presenterRight;
		             yourself.

	^ self makeLayout: mainPanel
]

{ #category : #initialization }
PyDoubleMenusPresenterAbstract >> initializeFirst [
]

{ #category : #initialization }
PyDoubleMenusPresenterAbstract >> initializePresenterCenter [

	^ self shouldBeImplemented
]

{ #category : #initialization }
PyDoubleMenusPresenterAbstract >> initializePresenterLeft [

	^ self createNoteBookWith: (views at: 1)
]

{ #category : #initialization }
PyDoubleMenusPresenterAbstract >> initializePresenterRight [

	^ self createNoteBookWith: (views at: 2)
]

{ #category : #initialization }
PyDoubleMenusPresenterAbstract >> initializePresenters [

	self initializeFirst.

	openMenu := #( true true ) asOrderedCollection.

	views := self initiliazeViews.

	presenterCenter := self initializePresenterCenter.
	presenterLeft := self initializePresenterLeft.
	presenterRight := self initializePresenterRight.

	toolbar := self initializeToolbar
]

{ #category : #initialization }
PyDoubleMenusPresenterAbstract >> initializeToolbar [

	^ (PyNavigationBarFactory new
		   add: self initializeToolbarLeft;
		   add: SpNullPresenter new;
		   add: self initializeToolbarRight;
		   yourself) build
]

{ #category : #initialization }
PyDoubleMenusPresenterAbstract >> initializeToolbarLeft [

	| nav |
	nav := PyNavigationMenu new.

	nav
		callback: [ 
			self changeMenuLeft.
			nav state: self isOpenLeft ];
		state: self isOpenLeft.

	^ nav
]

{ #category : #initialization }
PyDoubleMenusPresenterAbstract >> initializeToolbarRight [

	| nav |
	nav := PyNavigationMenu new.

	nav
		callback: [ 
			self changeMenuRight.
			nav state: self isOpenRight ];
		state: self isOpenRight.

	^ nav
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenterAbstract >> initiliazeViews [

	^ { 
		  {  }.
		  {  } }
]

{ #category : #testing }
PyDoubleMenusPresenterAbstract >> isOpenLeft [

	^ openMenu at: 1
]

{ #category : #testing }
PyDoubleMenusPresenterAbstract >> isOpenLeftAndRight [

	^ self isOpenLeft and: [ self isOpenRight ]
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenterAbstract >> isOpenRight [

	^ openMenu at: 2
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenterAbstract >> makeLayout: aMainPresenter [

	^ SpBoxLayout newTopToBottom
		  add: toolbar
		  withConstraints: [ :c | c height: PyNavigationAbstract height ];
		  add: aMainPresenter withConstraints: [ :c | c fill: true ];
		  yourself
]
