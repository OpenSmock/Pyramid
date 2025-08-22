Class {
	#name : #PyramidThemePropertyStrategy,
	#superclass : #PyramidHideEmptyPropertyStrategy,
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #'as yet unclassified' }
PyramidThemePropertyStrategy >> propertiesFor: aCollectionOfElements [

	| elementsWithStyleSheetTheme allPossibleStamps allCommonStamps |
	elementsWithStyleSheetTheme := aCollectionOfElements
		                               asOrderedCollection select: [
		                               :element |
		                               element isAttachedToSceneGraph and: [
			                               element lookupTheme isKindOf:
				                               ToStyleSheetTheme ] ].
	elementsWithStyleSheetTheme ifEmpty: [ ^ {  } ].
	allPossibleStamps := elementsWithStyleSheetTheme collect: [ :each |
		                     PyramidSelectorPossibleStamps new
			                     theme: each lookupTheme;
			                     findAllStampsFor: each ].
	allCommonStamps := allPossibleStamps first.
	allPossibleStamps do: [ :each |
		allCommonStamps := allCommonStamps & each ].
	^ allCommonStamps collect: [ :each | self propertyForStamp: each ].
]

{ #category : #'as yet unclassified' }
PyramidThemePropertyStrategy >> propertyForStamp: aStamp [

	| property |
	property := PyramidProperty new name: aStamp; command: (PyramidStampCommand new stamp: aStamp; yourself).
	^ property
]
