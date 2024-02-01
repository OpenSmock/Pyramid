Class {
	#name : #PyramidElementThemeSelectorPresenter,
	#superclass : #PyramidThemeSelectorPresenter,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'projectModel'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #'as yet unclassified' }
PyramidElementThemeSelectorPresenter >> applyTheme [

	| themeToApplied |
	themeToApplied := self themeSelector selectedItem variant:
		                  self variantSelector selectedItem new.
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
