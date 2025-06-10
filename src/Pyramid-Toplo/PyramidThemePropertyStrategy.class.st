Class {
	#name : #PyramidThemePropertyStrategy,
	#superclass : #PyramidHideEmptyPropertyStrategy,
	#category : #'Pyramid-Toplo-EXPERIMENTAL-plugin-theme-management'
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
			                               element localTheme isKindOf:
				                               ToStyleSheetTheme ] ].
	elementsWithStyleSheetTheme ifEmpty: [ ^ {  } ].
	allPossibleStamps := elementsWithStyleSheetTheme collect: [ :each |
		                     PyramidSelectorPossibleStamps new
			                     theme: each localTheme;
			                     findAllStampsFor: each ].
	allCommonStamps := allPossibleStamps first.
	allPossibleStamps do: [ :each |
		allCommonStamps := allCommonStamps & each ].
	^ allCommonStamps collect: [ :each | self propertyForStamp: each ].
]

{ #category : #'as yet unclassified' }
PyramidThemePropertyStrategy >> propertyForStamp: aStamp [

	| property |
	property := PyramidProperty new name: aStamp; command: (PyramidStampCommand new stamp: aStamp; yourself); inputPresenterClass: PyramidSwitchInputPresenter ; yourself.
	property inputPresenterModel onLabel: 'Has stamp'.
	property inputPresenterModel offLabel: 'Has not stamp'.
	property inputPresenterModel uncertainLabel: 'Uncertain'.
	^ property
]
