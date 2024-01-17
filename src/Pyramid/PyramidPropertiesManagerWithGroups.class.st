Class {
	#name : #PyramidPropertiesManagerWithGroups,
	#superclass : #PyramidPropertiesManager,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'groups',
		'projectModel',
		'presenter',
		'notebookPages',
		'defaultPage',
		'defaultManager'
	],
	#category : #'Pyramid-property'
}

{ #category : #adding }
PyramidPropertiesManagerWithGroups >> addProperty: aPyramidProperty [

	self defaultManager addProperty: aPyramidProperty
]

{ #category : #adding }
PyramidPropertiesManagerWithGroups >> atGroup: aSymbol [

	self groups
		at: aSymbol
		ifPresent: [ :manager | ^ manager ]
		ifAbsent: [ ^ self newGroupNamed: aSymbol ]
]

{ #category : #accessing }
PyramidPropertiesManagerWithGroups >> defaultManager [

	^ defaultManager
]

{ #category : #accessing }
PyramidPropertiesManagerWithGroups >> defaultPage [

	^ defaultPage
]

{ #category : #adding }
PyramidPropertiesManagerWithGroups >> groups [

	^ groups
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerWithGroups >> hasAnyPropertyWith: aCollection [

	^ self groups anySatisfy: [ :each | each hasAnyPropertyWith: aCollection ]
]

{ #category : #initialization }
PyramidPropertiesManagerWithGroups >> initialize [

	super initialize.
	groups := Dictionary new.
	notebookPages := Dictionary new.
	presenter := SpNotebookPresenter new.
	commandExecutor := PyramidCallbackCommandExecutor new
		                   wrappee: commandExecutor;
		                   yourself.
	commandExecutor afterDo: [ self projectModel informElementsChanged ].

	self initializeDefaultGroup
	
]

{ #category : #initialization }
PyramidPropertiesManagerWithGroups >> initializeDefaultGroup [

	defaultManager := PyramidPropertiesManagerForSelection new.
	defaultManager commandExecutor: self commandExecutor.
	defaultPage := SpNotebookPage
		               title: #Default
		               provider: [ self defaultManager presenter ].

	self groups at: #Default put: defaultManager.
	self notebookPages at: defaultManager put: defaultPage
]

{ #category : #initialization }
PyramidPropertiesManagerWithGroups >> newGroupNamed: aSymbol [

	| manager |
	manager := PyramidPropertiesManagerForSelection new.
	manager commandExecutor: self commandExecutor.
	groups at: aSymbol put: manager.

	self projectModel ifNotNil: [
		manager projectModel: self projectModel ].
	self notebookPages at: manager put: (SpNotebookPage title: aSymbol provider: [ manager presenter ]).
	^ manager
]

{ #category : #initialization }
PyramidPropertiesManagerWithGroups >> notebookPages [

	^ notebookPages
]

{ #category : #accessing }
PyramidPropertiesManagerWithGroups >> presenter [

	^ presenter
]

{ #category : #initialization }
PyramidPropertiesManagerWithGroups >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidPropertiesManagerWithGroups >> projectModel: aPyramidProjectModel [

	projectModel ifNotNil: [ projectModel removeObserver: self ].
	projectModel := aPyramidProjectModel.
	projectModel addObserver: self.

	self groups do: [ :each | each projectModel: aPyramidProjectModel ].
	self defaultManager projectModel: aPyramidProjectModel.
	self updateDisplayedGroups
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerWithGroups >> pyramidElementsChanged [

	self updateDisplayedGroups
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerWithGroups >> pyramidSelectionChanged [

	self updateDisplayedGroups
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerWithGroups >> updateDisplayedGroups [

	| allPages selectedPage |
	selectedPage := self presenter selectedPage.
	self presenter removeAll.
	self presenter addPage: self defaultPage.
	allPages := self groups
		            select: [ :each |
		            each hasAnyPropertyWith: self projectModel selection ]
		            thenCollect: [ :each | self notebookPages at: each ].
	allPages do: [ :each | self presenter addPage: each ].
	(allPages includes: selectedPage) ifTrue: [ self presenter selectPage: selectedPage ] ifFalse: [ self presenter selectPage:  self defaultPage]
	
]
