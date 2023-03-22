Class {
	#name : #PyDoubleMenusPresenter,
	#superclass : #PyDoubleMenusPresenterAbstract,
	#instVars : [
		'tree'
	],
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Properties'
}

{ #category : #opening }
PyDoubleMenusPresenter class >> openOnClass: aClass selector: aString [

	| editor |
	editor := self new.
	editor loadClass: aClass method: aString.
	editor open.
	^ editor
]

{ #category : #initialization }
PyDoubleMenusPresenter >> initializeFirst [

	root := BlElement new
		        background: Color black;
		        yourself
]

{ #category : #initialization }
PyDoubleMenusPresenter >> initializePresenterCenter [

	| presenter |
	presenter := self instantiate: PySpaceWithControlPresenter.
	presenter root: root.
	^ presenter
]

{ #category : #initialization }
PyDoubleMenusPresenter >> initializeToolbar [

	^ (PyNavigationBarFactory new
		   add: self initializeToolbarLeft;
		   add: SpNullPresenter new;
		   add: self initializeToolbarZoom;
		add: self initializeToolbarSave;
		   add: SpNullPresenter new;
		   add: self initializeToolbarRight;
		   yourself) build
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenter >> initializeToolbarSave [

	^ toolbarSave := PyNavigationSave new
		                 root: root;
		                 yourself
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenter >> initializeToolbarZoom [

	| zoomMenu |
	zoomMenu := PyNavigationZoom new
		            whenNumberChangedDo: [ :number | 
			            presenterCenter scaleBy: number / 100 ];
		            whenButtonCenterPressedDo: [ 
			            presenterCenter relocateOrigin ];
		            yourself.
	presenterCenter whenZoomIncrease: [ zoomMenu zoomIncrease ].
	presenterCenter whenZoomDecrease: [ zoomMenu zoomDecrease ].
	^ zoomMenu
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenter >> initiliazeViews [

	| properties |
	tree := PyViewTree2 new root: root.
	properties := PyViewProperties2 new.

	tree transmitTo: properties.


	^ { 
		  { tree }.
		  { properties } }
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenter >> loadClass: aClass method: aMethod [

	| package |
	package := RPackageOrganizer default packageOfClassNamed: aClass name.
	self loadFromPackage: package class: aClass method: aMethod
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenter >> loadFromPackage: aPackage class: aClass method: aMethod [

	| rootElement |
	(aClass respondsTo: aMethod)
		ifTrue: [ 
		rootElement := (aClass perform: aMethod) materializeAsBlElement ]
		ifFalse: [ rootElement := BlElement new background: Color black ].
	toolbarSave
		package: aPackage name
		class: aClass name
		method: aMethod.
	self root: rootElement
]

{ #category : #accessing }
PyDoubleMenusPresenter >> root [

	^ root
]

{ #category : #accessing }
PyDoubleMenusPresenter >> root: aBlElement [

	root := aBlElement.
	self whenRootChanged
]

{ #category : #'as yet unclassified' }
PyDoubleMenusPresenter >> whenRootChanged [

	toolbarSave root: self root.
	tree root: self root.
	presenterCenter root: self root
]
