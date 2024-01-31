Class {
	#name : #PyramidThemePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'themeSelector',
		'styleSheetEditor'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #layout }
PyramidThemePresenter >> defaultLayout [

	^ SpBoxLayout newVertical spacing: 4; add: self themeSelector expand: false; add: self styleSheetEditor expand: true; yourself
]

{ #category : #accessing }
PyramidThemePresenter >> editor: aPyramidEditor [

	self themeSelector projectModel: aPyramidEditor projectModel
]

{ #category : #layout }
PyramidThemePresenter >> initializePresenters [

	themeSelector := PyramidThemeSelectorPresenter new.
	styleSheetEditor := PyramidStyleSheetEditorPresenter new
]

{ #category : #layout }
PyramidThemePresenter >> styleSheetEditor [

	^ styleSheetEditor
]

{ #category : #layout }
PyramidThemePresenter >> themeSelector [

	^ themeSelector
]
