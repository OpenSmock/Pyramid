Class {
	#name : #PyramidShowCodePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'codePresenterForAll',
		'codePresenterForSelection',
		'projectModel'
	],
	#category : #'Pyramid-Bloc-plugin-showcode'
}

{ #category : #adding }
PyramidShowCodePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabLeft addItem: [ :builder |
			builder
				makeTab: self codePresenterForAll
				label: 'Code for all'
				icon: (Smalltalk ui icons iconNamed: #page)
				order: 5 ].
	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
			builder
				makeTab: self codePresenterForSelection
				label: 'Code for selection'
				icon: (Smalltalk ui icons iconNamed: #page)
				order: 999 ]
]

{ #category : #accessing }
PyramidShowCodePlugin >> codePresenterForAll [

	^ codePresenterForAll
]

{ #category : #accessing }
PyramidShowCodePlugin >> codePresenterForSelection [

	^ codePresenterForSelection
]

{ #category : #connecting }
PyramidShowCodePlugin >> connectOn: aPyramidEditor [

	projectModel := aPyramidEditor projectModel.
	aPyramidEditor projectModel announcer
		when: PyramidElementsChangedEvent
		do: [ :evt | self elementsChanged: evt ]
		for: self.
	aPyramidEditor projectModel announcer
		when: PyramidFirstLevelElementsChangedEvent
		do: [ :evt | self firstLevelElementsChanged: evt ]
		for: self.
	aPyramidEditor projectModel announcer
		when: PyramidSelectionChangedEvent
		do: [ :evt | self selectionChanged: evt ]
		for: self
]

{ #category : #'as yet unclassified' }
PyramidShowCodePlugin >> elementsChanged: aPyramidElementsChangedEvent [

	self firstLevelElementsChanged: aPyramidElementsChangedEvent.
	self selectionChanged: aPyramidElementsChangedEvent
]

{ #category : #'as yet unclassified' }
PyramidShowCodePlugin >> firstLevelElementsChanged: aPyramidFirstLevelElementsChangedEvent [

	self codePresenterForAll text: (Stash new serialize:
			 aPyramidFirstLevelElementsChangedEvent firstLevelElements)
]

{ #category : #initialization }
PyramidShowCodePlugin >> initialize [

	super initialize.
	codePresenterForAll := SpCodePresenter new
		                             beForScripting;
		                             whenSubmitDo: [ :text |
			                             self validateCodeForAll: text ];
		                             yourself.
	codePresenterForSelection := SpCodePresenter new
		                             beForScripting;
		                             whenSubmitDo: [ :text |
			                             self validateCodeForSelection: text ];
		                             yourself
]

{ #category : #accessing }
PyramidShowCodePlugin >> projectModel [

	^ projectModel
]

{ #category : #'event handling' }
PyramidShowCodePlugin >> selectionChanged: aPyramidSelectionChangedEvent [

	self codePresenterForSelection text: ''.
	aPyramidSelectionChangedEvent selection ifEmpty: [
			self codePresenterForSelection text: '"Select one element."'.
			^ self ].
	aPyramidSelectionChangedEvent selection size > 2 ifTrue: [
			self codePresenterForSelection text: '"Select only one element."'.
			^ self ].
	self codePresenterForSelection text: (Stash new serialize:
			 aPyramidSelectionChangedEvent selection first)
]

{ #category : #'as yet unclassified' }
PyramidShowCodePlugin >> validateCodeForAll: aString [

	| collection |
	collection := Stash new materialize: aString.
	collection isCollection ifFalse: [
		^ self inform: 'Could not serialize: The code is not a collection.' ].
	(collection allSatisfy: [ :each | each isKindOf: BlElement ])
		ifFalse: [
			^ self inform:
				  'Could not serialize: Not BlElement found in the code.' ].
	self projectModel firstLevelElements replaceAll: collection.
	self projectModel updateSelection
]

{ #category : #'as yet unclassified' }
PyramidShowCodePlugin >> validateCodeForSelection: aString [

	| newElement currentSelection |
	newElement := Stash new materialize: aString.
	(newElement isKindOf: BlElement) ifFalse: [
		^ self inform: 'Could not serialize: The code is not a BlElement.' ].
	self projectModel selection size = 1 ifFalse: [
			^ self inform:
				  'Could not serialize: The selection should only contains one element.' ].
	currentSelection := self projectModel selection first.
	(self projectModel firstLevelElements includes: currentSelection)
		ifTrue: [
				self projectModel firstLevelElements replaceAll:
					(self projectModel firstLevelElements asArray
						 copyReplaceAll: { currentSelection }
						 with: { newElement }) ].
	currentSelection parent ifNotNil: [ :p |
		p replaceChild: currentSelection with: newElement ].

	self projectModel selection replaceAll: { newElement }
]
