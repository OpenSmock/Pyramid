Class {
	#name : #PyramidThemePropertyStrategy,
	#superclass : #PyramidHideEmptyPropertyStrategy,
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #'as yet unclassified' }
PyramidThemePropertyStrategy >> propertiesFor: aElement [

	| elementsWithStyleSheetTheme allPossibleStamps allCommonStamps temp |
	
	self flag: 'the message asOrderedCollection is removed in pharo 13 as i know now the method have always 1 element in the aCollectionOfElements
	
	Need a refactorization of this part'.
	
	"Temp du to the problem with the message asOrderedCollection"
	temp := OrderedCollection new.
	temp add: aElement.
	
	elementsWithStyleSheetTheme := "aElement
		                               asOrderedCollection"temp select: [
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
