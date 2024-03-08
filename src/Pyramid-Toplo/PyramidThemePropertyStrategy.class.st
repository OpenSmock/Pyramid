Class {
	#name : #PyramidThemePropertyStrategy,
	#superclass : #PyramidHideEmptyPropertyStrategy,
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #'as yet unclassified' }
PyramidThemePropertyStrategy >> buildPresenterFromCollection: aCollection andManager: aManager [

	aManager removeAllProperties.
	aManager addAllProperties: (self propertiesFor: aCollection).
	^ super buildPresenterFromCollection: aCollection andManager: aManager
]

{ #category : #'as yet unclassified' }
PyramidThemePropertyStrategy >> propertiesFor: aCollectionOfElements [

	| elementsWithStyleSheetTheme allPossibleStamps allCommonStamps |
	elementsWithStyleSheetTheme := aCollectionOfElements
		                               asOrderedCollection select: [
		                               :element |
		                               element isAttachedToSceneGraph and: [
			                               element toTheme isKindOf:
				                               ToStyleSheetTheme ] ].
	elementsWithStyleSheetTheme ifEmpty: [ ^ {  } ].
	allPossibleStamps := elementsWithStyleSheetTheme collect: [ :each |
		                     PyramidSelectorPossibleStamps new
			                     theme: each toTheme;
			                     findAllStampsFor: each ].
	allCommonStamps := allPossibleStamps first.
	allPossibleStamps do: [ :each |
		allCommonStamps := allCommonStamps & each ].
	^ allCommonStamps collect: [ :each | self propertyForStamp: each ].
]

{ #category : #'as yet unclassified' }
PyramidThemePropertyStrategy >> propertyForStamp: aStamp [

	| property |
	property := PyramidProperty new name: aStamp; command: (PyramidStampCommand new stamp: aStamp; yourself); pyramidInputPresenterClass: PyramidSwitchInputPresenter ; yourself.
	property pyramidInputPresenterStrings onLabel: 'Has stamp'.
	property pyramidInputPresenterStrings offLabel: 'Has not stamp'.
	property pyramidInputPresenterStrings uncertainLabel: 'Uncertain'.
	^ property
]
