Class {
	#name : #PyEditor4Presenter,
	#superclass : #PyQuadrupleMenusPresenterInLine,
	#traits : 'PyBlocTakesRoot',
	#classTraits : 'PyBlocTakesRoot classTrait',
	#instVars : [
		'root',
		'menus',
		'tree1',
		'tree2',
		'tree3',
		'tree4',
		'navigationSave'
	],
	#category : #'Pyramid-Deprecated'
}

{ #category : #opening }
PyEditor4Presenter class >> openOnClass: aClass selector: aString [

	| editor |

	editor := self new.
	editor loadClass: aClass method: aString.
	editor open.
	^editor
]

{ #category : #initialization }
PyEditor4Presenter >> createNoteBookWith: aPyMenuCollection [

	| notebook |
	notebook := SpNotebookPresenter new.
	aPyMenuCollection do: [ :menu | 
		notebook addPage: menu asNotebookPage ].

	^ notebook
]

{ #category : #initialization }
PyEditor4Presenter >> initializeFirst [

	root := BlElement new background: Color black; yourself.
]

{ #category : #initialization }
PyEditor4Presenter >> initializeNavigation [

	^ (PyNavigationBarFactory new
		   add: self initializeNavigationLeft;
		add: SpNullPresenter new;
		   add: self initializeNavigationZoom;
		   add: self initializeNavigationSave;
		   add: self initializeNavigationRight;
		   yourself) build
]

{ #category : #initialization }
PyEditor4Presenter >> initializeNavigationSave [

	^ navigationSave := PyNavigationSave new root: root; yourself
]

{ #category : #initialization }
PyEditor4Presenter >> initializeNavigationZoom [

	| zoomMenu |
	zoomMenu := PyNavigationZoom new whenNumberChangedDo: [ :number | 
		            presenterCenter scaleBy: number / 100 ]; whenButtonCenterPressedDo: [ presenterCenter relocateOrigin ]; yourself.
	presenterCenter whenZoomIncrease: [ zoomMenu zoomIncrease ].
	presenterCenter whenZoomDecrease: [ zoomMenu zoomDecrease ].
	^ zoomMenu
]

{ #category : #initialization }
PyEditor4Presenter >> initializePresenter1 [

	^ self createNoteBookWith: (self menuFor: 1)
]

{ #category : #initialization }
PyEditor4Presenter >> initializePresenter2 [

	^ self createNoteBookWith: (self menuFor: 2)
]

{ #category : #initialization }
PyEditor4Presenter >> initializePresenter3 [

	^ self createNoteBookWith: (self menuFor: 3)
]

{ #category : #initialization }
PyEditor4Presenter >> initializePresenter4 [

	^ self createNoteBookWith: (self menuFor: 4)
]

{ #category : #initialization }
PyEditor4Presenter >> initializePresenterCenter [

	| presenter |
	presenter := self instantiate: PySpaceWithControlPresenter.
	presenter root: root.
	^ presenter
]

{ #category : #'as yet unclassified' }
PyEditor4Presenter >> initiliazeMenus [

	| menu1 menu2 menu3 menu4 allMenus inputs outputs |
	menu1 := { (tree1 := PyViewTree2 new root: root) }.
	menu2 := { PyViewProperties2 new }.
	menu3 := { PyViewProperties2 new }.
	menu4 := { PyViewProperties2 new }.

	allMenus := { 
		            menu1.
		            menu2.
		            menu3.
		            menu4 }.

	inputs := (allMenus flatCollect: [ :each | each ]) select:
		          #isPyBlocInput.
	outputs := (allMenus flatCollect: [ :each | each ]) select:
		           #isPyBlocOutput.

	inputs do: [ :input | 
		outputs do: [ :output | 
			input = output ifFalse: [ output transmitTo: input ] ] ].

	^ allMenus
]

{ #category : #'as yet unclassified' }
PyEditor4Presenter >> loadClass: aClass method: aMethod [
	
	| package |
	package := RPackageOrganizer default packageOfClassNamed: aClass name.
	self loadPackage: package class: aClass method: aMethod
]

{ #category : #'as yet unclassified' }
PyEditor4Presenter >> loadFromPackage: aPackage class: aClass method: aMethod [

	self flag: #TODO. "self root: STON fromString: aString"
	navigationSave package: aPackage class: aClass method: aMethod
]

{ #category : #'as yet unclassified' }
PyEditor4Presenter >> loadPackage: aRPackage class: aClass method: aString [

	| rootElement |
	(aClass respondsTo: aString)
		ifTrue: [ rootElement := (aClass perform: aString) materializeAsBlElement ]
		ifFalse: [ rootElement := BlElement new background: Color black ].
	navigationSave
		package: aRPackage name
		class: aClass name
		method: aString.
	self root: rootElement
]

{ #category : #'as yet unclassified' }
PyEditor4Presenter >> menuFor: anId [

	^ self menus at: anId
]

{ #category : #'as yet unclassified' }
PyEditor4Presenter >> menus [
	
	menus ifNil: [ menus := self initiliazeMenus ].
	^ menus
]

{ #category : #'as yet unclassified' }
PyEditor4Presenter >> whenRootChanged [

	navigationSave root: self root.
	tree1 root: self root.
	"tree2 root: self root.
	tree3 root: self root.
	tree4 root: self root."
	presenterCenter root: self root
]
