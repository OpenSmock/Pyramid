Class {
	#name : #PyramidElementThemeSelectorPresenter,
	#superclass : #PyramidThemeSelectorPresenter,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'projectModel',
		'inheritSelector',
		'labelPresenter',
		'commandExecutor',
		'themeCommand'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #'as yet unclassified' }
PyramidElementThemeSelectorPresenter >> applyTheme [

	| themeToApplied |
	self triggerThemeChangement ifFalse: [ ^ self ].
	themeToApplied := nil.
	self inheritSelector state ifFalse: [
		themeToApplied := self currentTheme ].
	self commandExecutor
		use: self themeCommand
		on: self projectModel selection asArray
		with: themeToApplied.
	self projectModel informElementsChanged
]

{ #category : #'as yet unclassified' }
PyramidElementThemeSelectorPresenter >> commandExecutor [

	^ commandExecutor
]

{ #category : #'as yet unclassified' }
PyramidElementThemeSelectorPresenter >> commandExecutor: aCommandExecutor [

	commandExecutor := aCommandExecutor
]

{ #category : #layout }
PyramidElementThemeSelectorPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self labelPresenter;
				   add: self buttonRefreshTheme withConstraints: [ :c |
					   c height: 24.
					   c width: 24 ];
				   yourself)
		  expand: false;
		add: self inheritSelector expand: false;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: 'Theme' width: 50;
				   add: self themeSelector;
				   yourself)
		  expand: false;
		  add: SpNullPresenter new height: 10;
		  yourself
]

{ #category : #accessing }
PyramidElementThemeSelectorPresenter >> inheritSelector [

	^ inheritSelector
]

{ #category : #initialization }
PyramidElementThemeSelectorPresenter >> initializePresenters [

	super initializePresenters.
	themeCommand := PyramidThemeCommand new.
	inheritSelector := SpCheckBoxPresenter new
		                   label: 'Inherits from parents';
		                   whenChangedDo: [ :aBoolean | self applyTheme ];
		                   yourself.
	labelPresenter := SpLabelPresenter new
		                  label: 'Element Theme (empty select)';
		                  displayBold: [ :t | true ];
		                  yourself.
	self triggerThemeChangement: false.
	self setDefaultStateForPresenters.
	self triggerThemeChangement: true
]

{ #category : #initialization }
PyramidElementThemeSelectorPresenter >> labelPresenter [

	^ labelPresenter
]

{ #category : #accessing }
PyramidElementThemeSelectorPresenter >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidElementThemeSelectorPresenter >> projectModel: anObject [

	projectModel := anObject.
	anObject addObserver: self
]

{ #category : #'as yet unclassified' }
PyramidElementThemeSelectorPresenter >> pyramidElementsChanged [

	self triggerThemeChangement: false.
	self updatePresenterFor: self projectModel selection.
	self triggerThemeChangement: true
]

{ #category : #'as yet unclassified' }
PyramidElementThemeSelectorPresenter >> pyramidSelectionChanged [

	self triggerThemeChangement: false.
	self updatePresenterFor: self projectModel selection.
	self triggerThemeChangement: true.
]

{ #category : #'as yet unclassified' }
PyramidElementThemeSelectorPresenter >> setDefaultStateForPresenters [.
	self themeSelector enabled: false.
	self inheritSelector enabled: false.
	self inheritSelector state: true.

]

{ #category : #'as yet unclassified' }
PyramidElementThemeSelectorPresenter >> themeCommand [

	^ themeCommand
]

{ #category : #'as yet unclassified' }
PyramidElementThemeSelectorPresenter >> updatePresenterFor: aCollectionOfElement [

	| collectionOfLocalThemes |
	"Default values"
	self setDefaultStateForPresenters.

	"Empty state"
	aCollectionOfElement ifEmpty: [
		self labelPresenter label: 'Element Theme (empty select)'.
		^ self ].

	"Only one element selected state"
	aCollectionOfElement size = 1 ifTrue: [
		self labelPresenter label: 'Element Theme'.
		self inheritSelector enabled: true.
		aCollectionOfElement first localTheme ifNotNil: [ :theme |
			self inheritSelector state: false.
			self themeSelector enabled: true.
			self selectTheme: theme ].
		^ self ].

	"Mix between local and unlocal theme"
	collectionOfLocalThemes := (aCollectionOfElement asArray collect: [
		                            :each | each localTheme ]) asSet asArray.
	collectionOfLocalThemes size > 1 ifTrue: [
		self labelPresenter label: 'Elements Theme (differents)'.
		^ self ].

	self labelPresenter label: 'Elements Theme'.
	self inheritSelector enabled: true.

	"All local theme"
	collectionOfLocalThemes first ifNotNil: [
		self inheritSelector state: false.
		self themeSelector enabled: true.
		self selectTheme: collectionOfLocalThemes first ].

	self layout: self defaultLayout
]
