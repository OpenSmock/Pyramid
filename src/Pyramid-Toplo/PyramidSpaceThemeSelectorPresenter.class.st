Class {
	#name : #PyramidSpaceThemeSelectorPresenter,
	#superclass : #PyramidThemeSelectorPresenter,
	#traits : 'TPyramidSpaceExtension',
	#classTraits : 'TPyramidSpaceExtension classTrait',
	#instVars : [
		'projectModel'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #'as yet unclassified' }
PyramidSpaceThemeSelectorPresenter >> applyTheme [

	self builder space toTheme: self currentTheme.
	self projectModel informElementsChanged
]

{ #category : #accessing }
PyramidSpaceThemeSelectorPresenter >> builder [

	^ builder
]

{ #category : #accessing }
PyramidSpaceThemeSelectorPresenter >> builder: anObject [

	builder:= anObject.
]

{ #category : #accessing }
PyramidSpaceThemeSelectorPresenter >> editor: aPyramidEditor [
]

{ #category : #displaying }
PyramidSpaceThemeSelectorPresenter >> installOn: aBuilder [

	self builder: aBuilder.
		
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
