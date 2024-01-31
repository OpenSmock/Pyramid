Class {
	#name : #PyramidThemeSelectorPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'themeSelector',
		'variantSelector',
		'buttonRefreshTheme',
		'projectModel',
		'styleSheetEditor'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #'as yet unclassified' }
PyramidThemeSelectorPresenter >> applyThemeToRoot [

	| themeToApplied |
	self projectModel ifNil: [ ^ self ].
	self elementRoot ifNil: [ ^ self ].
	themeToApplied := self themeSelector selectedItem variant:
		                  self variantSelector selectedItem new.
	self elementRoot space toTheme: themeToApplied.
	self elementRoot space pulse
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> buttonRefreshTheme [

	^ buttonRefreshTheme
]

{ #category : #layout }
PyramidThemeSelectorPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: (SpLabelPresenter new
						    label: 'Space Theme';
						    displayBold: [ :t | true ];
						    yourself);
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

{ #category : #accessing }
PyramidThemeSelectorPresenter >> elementRoot [

	self projectModel firstLevelElements ifEmpty: [ ^ nil ] ifNotEmpty: [ :elements | ^ elements first parent ]
]

{ #category : #initialization }
PyramidThemeSelectorPresenter >> initializeAllPossibleThemes [

	| allThemes previousTheme |
	previousTheme := self themeSelector selectedItem.

	allThemes := ToTheme allSubclasses select: [ :theme |
		             theme canBeDefault ].
	self themeSelector items: allThemes.

	(previousTheme isNotNil and: [ allThemes includes: previousTheme ])
		ifTrue: [ self themeSelector selectItem: previousTheme ]
		ifFalse: [ self themeSelector selectItem: allThemes first ]
]

{ #category : #initialization }
PyramidThemeSelectorPresenter >> initializePresenters [

	styleSheetEditor := PyramidStyleSheetEditorPresenter new.
	buttonRefreshTheme := SpButtonPresenter new
		                      icon: (self iconNamed: #refresh);
		                      action: [ self initializeAllPossibleThemes ];
		                      yourself.
	themeSelector := SpDropListPresenter new
		                 whenSelectedItemChangedDo: [ :aThemeClass |
			                 self themeSelectionChanged: aThemeClass ];
		                 yourself.
	variantSelector := SpDropListPresenter new
		                   whenSelectedItemChangedDo: [ :aNewVariant |
			                   self variantSelectionChanged: aNewVariant ];
		                   yourself.
	self initializeAllPossibleThemes
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> projectModel: anObject [

	projectModel := anObject
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> styleSheetEditor [

	^ styleSheetEditor
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
	self applyThemeToRoot
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> themeSelector [

	^ themeSelector
]

{ #category : #'as yet unclassified' }
PyramidThemeSelectorPresenter >> variantSelectionChanged: aVariantClass [

	aVariantClass ifNil: [ ^ self ].
	self applyThemeToRoot
]

{ #category : #accessing }
PyramidThemeSelectorPresenter >> variantSelector [

	^ variantSelector
]
