Class {
	#name : #PyramidThemeSelectorPresenter,
	#superclass : #SpPresenter,
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'themeSelector',
		'variantSelector',
		'buttonRefreshTheme',
		'triggerThemeChangement'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #'as yet unclassified' }
PyramidThemeSelectorPresenter >> applyTheme [

 self shouldBeImplemented
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> buttonRefreshTheme [

	^ buttonRefreshTheme
]

{ #category : #'as yet unclassified' }
PyramidThemeSelectorPresenter >> currentTheme [

	^ self themeSelector selectedItem variant:
			                  self variantSelector selectedItem new
]

{ #category : #layout }
PyramidThemeSelectorPresenter >> defaultLayout [

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
		 add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: 'Theme' width: 50;
				   add: self themeSelector;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: 'Variant' width: 50;
				   add: self variantSelector;
				   yourself)
		  expand: false;
		  add: SpNullPresenter new height: 10;
		  yourself
]

{ #category : #initialization }
PyramidThemeSelectorPresenter >> initializeAllPossibleThemes [

	| allThemes previousTheme |
	previousTheme := self themeSelector selectedItem.

	allThemes := ToTheme allSubclasses select: [ :theme |
		             theme canBeDefault ].

	self triggerThemeChangement: false.
	self themeSelector items: allThemes.

	(previousTheme isNotNil and: [ allThemes includes: previousTheme ])
		ifTrue: [ self themeSelector selectItem: previousTheme ]
		ifFalse: [ self themeSelector selectItem: allThemes first ].
	self triggerThemeChangement: true.
]

{ #category : #initialization }
PyramidThemeSelectorPresenter >> initializePresenters [

	triggerThemeChangement := false.
	themeSelector := SpDropListPresenter new
		                 whenSelectedItemChangedDo: [ :aThemeClass |
			                 self themeSelectionChanged: aThemeClass ];
		                 yourself.
	variantSelector := SpDropListPresenter new
		                   whenSelectedItemChangedDo: [ :aNewVariant |
			                   self variantSelectionChanged: aNewVariant ];
		                   yourself.
	buttonRefreshTheme := SpButtonPresenter new
	help: 'Refresh theme list.';
		                      icon: (self iconNamed: #refresh);
		                      action: [ self initializeAllPossibleThemes ];
		                      yourself.
	self initializeAllPossibleThemes
]

{ #category : #initialization }
PyramidThemeSelectorPresenter >> labelPresenter [

	^ self shouldBeImplemented
]

{ #category : #private }
PyramidThemeSelectorPresenter >> selectTheme: aToTheme [

	self triggerThemeChangement: false.
	
	self themeSelector selectItem: aToTheme class.
	self variantSelector selectItem: aToTheme variant class.
	
	self triggerThemeChangement: true.
	
]

{ #category : #'as yet unclassified' }
PyramidThemeSelectorPresenter >> themeSelectionChanged: aThemeClass [

	| previousVariant |
	aThemeClass ifNil: [ ^ self ].
	previousVariant := self variantSelector selectedItem.
	self variantSelector items: aThemeClass supportedVariantClasses.
	self variantSelector selectItem:
		((aThemeClass supportedVariantClasses includes: previousVariant)
			 ifTrue: [ previousVariant ]
			 ifFalse: [ aThemeClass supportedVariantClasses first ]).
	self triggerThemeChangement ifTrue: [ self applyTheme ]
	
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> themeSelector [

	^ themeSelector
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> triggerThemeChangement [

	^ triggerThemeChangement
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> triggerThemeChangement: anObject [

	triggerThemeChangement := anObject
]

{ #category : #'as yet unclassified' }
PyramidThemeSelectorPresenter >> variantSelectionChanged: aVariantClass [

	aVariantClass ifNil: [ ^ self ].
	self triggerThemeChangement ifTrue: [ self applyTheme ]
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> variantSelector [

	^ variantSelector
]
