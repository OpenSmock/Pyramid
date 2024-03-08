Class {
	#name : #PyramidThemePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'styleSheetEditor',
		'themeSpaceSelector',
		'themeElementSelector'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #layout }
PyramidThemePresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self themeSpaceSelector expand: false;
		 add: self themeElementSelector expand: false;
		  add: self styleSheetEditor expand: true;
		  yourself
]

{ #category : #accessing }
PyramidThemePresenter >> editor: aPyramidEditor [

	self themeSpaceSelector projectModel: aPyramidEditor projectModel.
	self themeElementSelector projectModel: aPyramidEditor projectModel.
	self themeElementSelector commandExecutor: aPyramidEditor propertiesManager commandExecutor 
]

{ #category : #layout }
PyramidThemePresenter >> initializePresenters [

	themeSpaceSelector := PyramidSpaceThemeSelectorPresenter new.
	themeElementSelector := PyramidElementThemeSelectorPresenter new.
	styleSheetEditor := PyramidStyleSheetEditorPresenter new
]

{ #category : #'as yet unclassified' }
PyramidThemePresenter >> pyramidSpaceBuilderConfigurationOn: aSpaceBuilder [

	aSpaceBuilder addExtension: self themeSpaceSelector
]

{ #category : #layout }
PyramidThemePresenter >> styleSheetEditor [

	^ styleSheetEditor
]

{ #category : #layout }
PyramidThemePresenter >> themeElementSelector [

	^ themeElementSelector
]

{ #category : #layout }
PyramidThemePresenter >> themeSpaceSelector [

	^ themeSpaceSelector
]
