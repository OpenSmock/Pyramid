Class {
	#name : #PyramidSpaceThemeSelectorPresenter,
	#superclass : #PyramidThemeSelectorPresenter,
	#traits : 'TPyramidSpaceExtension',
	#classTraits : 'TPyramidSpaceExtension classTrait',
	#instVars : [
		'projectModel'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #'as yet unclassified' }
PyramidSpaceThemeSelectorPresenter >> applyTheme [

	self builder space toTheme: self currentTheme.
	self projectModel informElementsChanged
]

{ #category : #initialization }
PyramidSpaceThemeSelectorPresenter >> labelPresenter [

	^ SpLabelPresenter new
		  label: 'Space Theme';
		  displayBold: [ :t | true ];
		  yourself
]

{ #category : #accessing }
PyramidSpaceThemeSelectorPresenter >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSpaceThemeSelectorPresenter >> projectModel: anObject [

	projectModel := anObject
]
