Class {
	#name : #PyQuadrupleMenusPresenterInLine,
	#superclass : #PyEditorPresenterAbstract,
	#instVars : [
		'openMenu',
		'presenterCenter',
		'presenter1',
		'presenter2',
		'presenter3',
		'presenter4',
		'navigation'
	],
	#category : #'Pyramid-Deprecated'
}

{ #category : #testing }
PyQuadrupleMenusPresenterInLine class >> isAbstract [

	^ self == PyQuadrupleMenusPresenterInLine
]

{ #category : #accessing }
PyQuadrupleMenusPresenterInLine >> changeMenuAt: anId [

	openMenu at: anId put: (openMenu at: anId) not.
	self layout: self defaultLayout.
]

{ #category : #action }
PyQuadrupleMenusPresenterInLine >> changeMenuLeftBottom [

	self changeMenuAt: 2
]

{ #category : #action }
PyQuadrupleMenusPresenterInLine >> changeMenuLeftTop [

	self changeMenuAt: 1
]

{ #category : #action }
PyQuadrupleMenusPresenterInLine >> changeMenuRightBottom [

	self changeMenuAt: 4
]

{ #category : #action }
PyQuadrupleMenusPresenterInLine >> changeMenuRightTop [

	self changeMenuAt: 3.
]

{ #category : #layout }
PyQuadrupleMenusPresenterInLine >> defaultLayout [

	self isRightAndLeftMenuOpen ifTrue: [ ^ self defaultLayoutLeftRight ].
	self isRightMenuOpen ifTrue: [ ^ self defaultLayoutRight ].
	self isLeftMenuOpen ifTrue: [ ^ self defaultLayoutLeft ].
	^ self defaultLayoutCenter
]

{ #category : #layout }
PyQuadrupleMenusPresenterInLine >> defaultLayoutCenter [

	^ self makeLayout: self makeCenterPanel
]

{ #category : #layout }
PyQuadrupleMenusPresenterInLine >> defaultLayoutLeft [

	| presenterLeft mainPanel |
	presenterLeft := self makeLeftPanel.

	mainPanel := SpPanedLayout newLeftToRight
		             positionOfSlider: 0.2;
		             add: presenterLeft;
		             add: self makeCenterPanel;
		             yourself.

	^ self makeLayout: mainPanel
]

{ #category : #layout }
PyQuadrupleMenusPresenterInLine >> defaultLayoutLeftRight [

	| presenterLeft presenterRight mainPanel |
	presenterLeft := self makeLeftPanel.
	presenterRight := self makeRightPanel.

	mainPanel := SpPanedLayout newLeftToRight
		             positionOfSlider: 0.2;
		             add: presenterLeft;
		             add: (SpPanedLayout newLeftToRight
				              positionOfSlider: 0.75;
				              add: self makeCenterPanel;
				              add: presenterRight;
				              yourself);
		             yourself.

	^ self makeLayout: mainPanel
]

{ #category : #layout }
PyQuadrupleMenusPresenterInLine >> defaultLayoutRight [

	| presenterRight mainPanel |
	presenterRight := self makeRightPanel.

	mainPanel := SpPanedLayout newLeftToRight
		             positionOfSlider: 0.8;
		             add: self makeCenterPanel;
		             add: presenterRight;
		             yourself.

	^ self makeLayout: mainPanel
]

{ #category : #initialization }
PyQuadrupleMenusPresenterInLine >> initializeFirst [
]

{ #category : #initialization }
PyQuadrupleMenusPresenterInLine >> initializeNavigation [

	^ (PyNavigationBarFactory new
		  add: self initializeNavigationLeft;
		  add: self initializeNavigationRight;
		  yourself) build
]

{ #category : #initialization }
PyQuadrupleMenusPresenterInLine >> initializeNavigationLeft [

	| nav |
	nav := PyNavigationDoubleMenu new.

	nav
		callbackLeft: [ 
			self changeMenuLeftTop.
			nav stateLeft: (openMenu at: 1) ];
		callbackRight: [ 
			self changeMenuLeftBottom.
			nav stateRight: (openMenu at: 2) ];
		stateLeft: false;
		stateRight: false.

	^ nav
]

{ #category : #initialization }
PyQuadrupleMenusPresenterInLine >> initializeNavigationRight [

	| nav |
	nav := PyNavigationDoubleMenu new.

	nav
		callbackLeft: [ 
			self changeMenuRightBottom.
			nav stateLeft: (openMenu at: 4) ];
		callbackRight: [ 
			self changeMenuRightTop.
			nav stateRight: (openMenu at: 3) ];
		stateLeft: false;
		stateRight: false.

	^ nav
]

{ #category : #initialization }
PyQuadrupleMenusPresenterInLine >> initializePresenter1 [

	^ self shouldBeImplemented
]

{ #category : #initialization }
PyQuadrupleMenusPresenterInLine >> initializePresenter2 [

	^ self shouldBeImplemented
]

{ #category : #initialization }
PyQuadrupleMenusPresenterInLine >> initializePresenter3 [

	^ self shouldBeImplemented
]

{ #category : #initialization }
PyQuadrupleMenusPresenterInLine >> initializePresenter4 [

	^ self shouldBeImplemented
]

{ #category : #initialization }
PyQuadrupleMenusPresenterInLine >> initializePresenterCenter [

	^ self shouldBeImplemented
]

{ #category : #initialization }
PyQuadrupleMenusPresenterInLine >> initializePresenters [

	self initializeFirst.

	openMenu := #( false false false false ) asOrderedCollection.

	presenterCenter := self initializePresenterCenter.
	presenter1 := self initializePresenter1.
	presenter2 := self initializePresenter2.
	presenter3 := self initializePresenter3.
	presenter4 := self initializePresenter4.
	
navigation := self initializeNavigation.
]

{ #category : #testing }
PyQuadrupleMenusPresenterInLine >> isLeftBottomAndLeftTopMenuOpen [

	^ (openMenu at: 1) and: [ openMenu at: 2 ]
]

{ #category : #testing }
PyQuadrupleMenusPresenterInLine >> isLeftBottomMenuOpen [

	^ openMenu at: 2
]

{ #category : #testing }
PyQuadrupleMenusPresenterInLine >> isLeftMenuOpen [

	^ (openMenu at: 1) or: [ openMenu at: 2 ]
]

{ #category : #testing }
PyQuadrupleMenusPresenterInLine >> isLeftTopMenuOpen [

	^ openMenu at: 1
]

{ #category : #testing }
PyQuadrupleMenusPresenterInLine >> isRightAndLeftMenuOpen [

	^((openMenu at: 1) or: [ (openMenu at: 2) ]) and: [ ((openMenu at: 3) or: [ (openMenu at: 4) ]) ]
]

{ #category : #testing }
PyQuadrupleMenusPresenterInLine >> isRightBottomAndRightTopMenuOpen [

	^ (openMenu at: 3) and: [ openMenu at: 4 ]
]

{ #category : #testing }
PyQuadrupleMenusPresenterInLine >> isRightBottomMenuOpen [

	^ openMenu at: 4
]

{ #category : #testing }
PyQuadrupleMenusPresenterInLine >> isRightMenuOpen [

	^ (openMenu at: 3) or: [ openMenu at: 4 ]
]

{ #category : #testing }
PyQuadrupleMenusPresenterInLine >> isRightTopMenuOpen [

	^ openMenu at: 3
]

{ #category : #layout }
PyQuadrupleMenusPresenterInLine >> makeCenterPanel [

	^ presenterCenter
]

{ #category : #'private - layout' }
PyQuadrupleMenusPresenterInLine >> makeLayout: aMainPresenter [

	^ SpBoxLayout newTopToBottom
		add: navigation
		withConstraints: [ :c | c height: PyNavigationAbstract height ];
		add: aMainPresenter withConstraints: [ :c | c fill: true ];
		yourself.
]

{ #category : #'private - layout' }
PyQuadrupleMenusPresenterInLine >> makeLeftPanel [

	self isLeftBottomAndLeftTopMenuOpen ifTrue: [ 
		^ SpPanedLayout newTopToBottom
					   positionOfSlider: 0.33;
					   add: presenter2;
					   add: presenter1;
					   yourself
			  ].
	self isLeftBottomMenuOpen ifTrue: [ ^ presenter1 ].
	self isLeftTopMenuOpen ifTrue: [ ^ presenter2 ].
	^ SpNullPresenter new
]

{ #category : #'private - layout' }
PyQuadrupleMenusPresenterInLine >> makeRightPanel [

	self isRightBottomAndRightTopMenuOpen ifTrue: [ 
		^ SpPanedLayout newTopToBottom
			  positionOfSlider: 0.66;
			  add: presenter4;
			  add: presenter3;
			  yourself ].
	self isRightBottomMenuOpen ifTrue: [ ^ presenter3 ].
	self isRightTopMenuOpen ifTrue: [ ^ presenter4 ].
	^ SpNullPresenter new
]
