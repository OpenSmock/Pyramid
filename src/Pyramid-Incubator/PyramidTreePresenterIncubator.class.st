Class {
	#name : #PyramidTreePresenterIncubator,
	#superclass : #SpPresenter,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'treePresenter',
		'shouldUpdateSelection',
		'editor'
	],
	#category : #'Pyramid-Incubator-plugin-hierarchy-selection-helper'
}

{ #category : #accessing }
PyramidTreePresenterIncubator >> columns [

	^ { PyramidTreeColumnIncubator nameAndType }
]

{ #category : #accessing }
PyramidTreePresenterIncubator >> connectOn: aPyramidEditor [

	self editor: aPyramidEditor.
	aPyramidEditor projectModel addObserver: self.
]

{ #category : #api }
PyramidTreePresenterIncubator >> contextMenu [

	| menu |
	menu := (self editor window services at: #selectionMenu) builder
		        menuFor: self editor projectModel selection.
	^ menu
]

{ #category : #layout }
PyramidTreePresenterIncubator >> defaultLayout [

	^ SpBoxLayout newVertical add: self treePresenter; yourself
]

{ #category : #accessing }
PyramidTreePresenterIncubator >> editor [

	^ editor
]

{ #category : #accessing }
PyramidTreePresenterIncubator >> editor: anObject [

	editor := anObject.
	self updateRoots
]

{ #category : #initialization }
PyramidTreePresenterIncubator >> initializePresenters [

	shouldUpdateSelection := true.

	treePresenter := SpTreeTablePresenter new.
	treePresenter whenSelectionChangedDo: [ :newSelection |
		self treeSelectionChanged: newSelection ].

	treePresenter
		beMultipleSelection;
		beResizable;
		roots: {  };
		children: [ :each | each children ];
		contextMenu: [ self contextMenu ];
		expandAll.

	self columns do: [ :each | treePresenter addColumn: each ]
]

{ #category : #'as yet unclassified' }
PyramidTreePresenterIncubator >> pyramidElementsChanged [

	self updateRoots
]

{ #category : #'as yet unclassified' }
PyramidTreePresenterIncubator >> pyramidRootsChanged [

	self updateRoots
]

{ #category : #'as yet unclassified' }
PyramidTreePresenterIncubator >> pyramidSelectionChanged [

	self updateSelection
]

{ #category : #accessing }
PyramidTreePresenterIncubator >> shouldUpdateSelection [
	^ shouldUpdateSelection
]

{ #category : #accessing }
PyramidTreePresenterIncubator >> shouldUpdateSelection: aBoolean [

	shouldUpdateSelection := aBoolean
]

{ #category : #accessing }
PyramidTreePresenterIncubator >> treePresenter [

	^ treePresenter
]

{ #category : #'as yet unclassified' }
PyramidTreePresenterIncubator >> treeSelectionChanged: aCollection [

	self editor ifNil: [ ^ self ].
	self shouldUpdateSelection ifFalse: [ ^ self ].
	self shouldUpdateSelection: false.
	self editor projectModel selection replaceAll: aCollection selectedItems.
	self shouldUpdateSelection: true
]

{ #category : #accessing }
PyramidTreePresenterIncubator >> updateRoots [

	self shouldUpdateSelection: false.
	self treePresenter roots: self editor projectModel roots asArray.
	self shouldUpdateSelection: true.
	self updateSelection
]

{ #category : #'as yet unclassified' }
PyramidTreePresenterIncubator >> updateSelection [

	self editor projectModel ifNil: [ ^ self ].
	self shouldUpdateSelection ifFalse: [ ^ self ].
	self shouldUpdateSelection: false.
	self editor projectModel selection
		ifEmpty: [ self treePresenter unselectAll ]
		ifNotEmpty: [
		self treePresenter selectItems: self editor projectModel selection ].
	self shouldUpdateSelection: true
]
