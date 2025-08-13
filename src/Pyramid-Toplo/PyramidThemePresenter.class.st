Class {
	#name : #PyramidThemePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'projectModel',
		'themeSpaceSelector',
		'themeElementSelector',
		'treeTableStampPresenter'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #layout }
PyramidThemePresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self themeSpaceSelector expand: false;
		  add: self themeElementSelector expand: false;
		  add: self treeTableStampPresenter;
		  yourself
]

{ #category : #accessing }
PyramidThemePresenter >> editor: aPyramidEditor [

	self themeSpaceSelector projectModel: aPyramidEditor projectModel.
	self themeElementSelector projectModel: aPyramidEditor projectModel.
	self themeElementSelector commandExecutor:
		aPyramidEditor commandExecutor
]

{ #category : #layout }
PyramidThemePresenter >> initializePresenters [

	themeSpaceSelector := PyramidSpaceThemeSelectorPresenter new.
	themeElementSelector := PyramidElementThemeSelectorPresenter new.
	
	treeTableStampPresenter := PyramidStampManagerPresenter new.
]

{ #category : #accessing }
PyramidThemePresenter >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidThemePresenter >> projectModel: aProjectModel [

	projectModel := aProjectModel
]

{ #category : #'as yet unclassified' }
PyramidThemePresenter >> pyramidSpaceBuilderConfigurationOn: aSpaceBuilder [

	aSpaceBuilder addExtension: self themeSpaceSelector
]

{ #category : #layout }
PyramidThemePresenter >> themeElementSelector [

	^ themeElementSelector
]

{ #category : #layout }
PyramidThemePresenter >> themeSpaceSelector [

	^ themeSpaceSelector
]

{ #category : #accessing }
PyramidThemePresenter >> treeTableStampPresenter [

	^ treeTableStampPresenter
]
