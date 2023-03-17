Class {
	#name : #PyEditor3Presenter,
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
PyEditor3Presenter class >> openOnClass: aClass selector: aString [

	| editor |

	editor := self new.
	editor loadClass: aClass method: aString.
	editor open.
	^editor
]

{ #category : #initialization }
PyEditor3Presenter >> createNoteBookWith: aPyMenuCollection [

	| notebook |
	notebook := SpNotebookPresenter new.
	aPyMenuCollection do: [ :menu | 
		notebook addPage: menu asNotebookPage ].

	^ notebook
]

{ #category : #initialization }
PyEditor3Presenter >> initializeFirst [

	root := BlElement new background: Color black; yourself.
]

{ #category : #initialization }
PyEditor3Presenter >> initializeNavigation [

	^ (PyNavigationBarFactory new
		   add: self initializeNavigationLeft;
		add: SpNullPresenter new;
		   add: self initializeNavigationZoom;
		   add: self initializeNavigationSave;
		   add: self initializeNavigationRight;
		   yourself) build
]

{ #category : #initialization }
PyEditor3Presenter >> initializeNavigationSave [

	^ navigationSave := PyNavigationSave new root: root; yourself
]

{ #category : #initialization }
PyEditor3Presenter >> initializeNavigationZoom [

	| zoomMenu |
	zoomMenu := PyNavigationZoom new whenNumberChangedDo: [ :number | 
		            presenterCenter scaleBy: number / 100 ]; whenButtonCenterPressedDo: [ presenterCenter relocateOrigin ]; yourself.
	presenterCenter whenZoomIncrease: [ zoomMenu zoomIncrease ].
	presenterCenter whenZoomDecrease: [ zoomMenu zoomDecrease ].
	^ zoomMenu
]

{ #category : #initialization }
PyEditor3Presenter >> initializePresenter1 [

	^ self createNoteBookWith: (self menuFor: 1)
]

{ #category : #initialization }
PyEditor3Presenter >> initializePresenter2 [

	^ self createNoteBookWith: (self menuFor: 2)
]

{ #category : #initialization }
PyEditor3Presenter >> initializePresenter3 [

	^ self createNoteBookWith: (self menuFor: 3)
]

{ #category : #initialization }
PyEditor3Presenter >> initializePresenter4 [

	^ self createNoteBookWith: (self menuFor: 4)
]

{ #category : #initialization }
PyEditor3Presenter >> initializePresenterCenter [

	| presenter |
	presenter := self instantiate: PySpaceWithControlPresenter.
	presenter root: root.
	^ presenter
]

{ #category : #'as yet unclassified' }
PyEditor3Presenter >> initiliazeMenus [

	| menu1 menu2 menu3 menu4 allMenus inputs outputs |
	menu1 := { 
		         (tree1 := PyViewTree new root: root).
		         PyViewProperties new.
		         PyViewGeometry new.
		         PyViewPreview new.
		         PyViewPlayground new }.

	menu2 := { 
		         (tree2 := PyViewTree new root: root).
		         PyViewProperties new.
		         PyViewGeometry new.
		         PyViewPreview new.
		         PyViewPlayground new }.

	menu3 := { 
		         (tree3 := PyViewTree new root: root).
		         PyViewProperties new.
		         PyViewGeometry new.
		         PyViewPreview new.
		         PyViewPlayground new }.

	menu4 := { 
		         (tree4 := PyViewTree new root: root).
		         PyViewProperties new.
		         PyViewGeometry new.
		         PyViewPreview new.
		         PyViewPlayground new }.

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
PyEditor3Presenter >> loadClass: aClass method: aMethod [
	
	| package |
	package := RPackageOrganizer default packageOfClassNamed: aClass name.
	self loadPackage: package class: aClass method: aMethod
]

{ #category : #'as yet unclassified' }
PyEditor3Presenter >> loadFromPackage: aPackage class: aClass method: aMethod [

	self flag: #TODO. "self root: STON fromString: aString"
	navigationSave package: aPackage class: aClass method: aMethod
]

{ #category : #'as yet unclassified' }
PyEditor3Presenter >> loadPackage: aRPackage class: aClass method: aString [

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
PyEditor3Presenter >> menuFor: anId [

	^ self menus at: anId
]

{ #category : #'as yet unclassified' }
PyEditor3Presenter >> menus [
	
	menus ifNil: [ menus := self initiliazeMenus ].
	^ menus
]
