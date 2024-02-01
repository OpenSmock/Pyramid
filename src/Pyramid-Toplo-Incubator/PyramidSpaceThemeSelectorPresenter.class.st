Class {
	#name : #PyramidSpaceThemeSelectorPresenter,
	#superclass : #PyramidThemeSelectorPresenter,
	#traits : 'TPyramidSpaceExtension + TPyramidEditorSpaceIsReadyObserver',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorSpaceIsReadyObserver classTrait',
	#instVars : [
		'projectModel'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #'as yet unclassified' }
PyramidSpaceThemeSelectorPresenter >> applyTheme [

	| themeToApplied |
	themeToApplied := self themeSelector selectedItem variant:
		                  self variantSelector selectedItem new.
	self builder space toTheme: themeToApplied.
	self projectModel informElementsChanged
]

{ #category : #'as yet unclassified' }
PyramidSpaceThemeSelectorPresenter >> informSpaceIsReady [

	self applyTheme
]

{ #category : #displaying }
PyramidSpaceThemeSelectorPresenter >> installOn: aBuilder [

	self builder: aBuilder.
	aBuilder addSpaceIsReadyObserver: self.
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
