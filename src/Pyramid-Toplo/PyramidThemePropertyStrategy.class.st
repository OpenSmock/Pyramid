Class {
	#name : #PyramidThemePropertyStrategy,
	#superclass : #PyramidHideEmptyPropertyStrategy,
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #'as yet unclassified' }
PyramidThemePropertyStrategy >> propertiesFor: aElement [

	| elementWithStyleSheetTheme allPossibleStamps |
	
	elementWithStyleSheetTheme := (aElement isAttachedToSceneGraph and: [
			                               aElement lookupTheme isKindOf:
				                               ToStyleSheetTheme ]) ifTrue: [ aElement ].
	elementWithStyleSheetTheme ifNil: [ ^ {  } ].
	allPossibleStamps := PyramidSelectorPossibleStamps new
			                     theme: elementWithStyleSheetTheme lookupTheme;
			                     findAllStampsFor: elementWithStyleSheetTheme.
	^ allPossibleStamps collect: [ :each | self propertyForStamp: each ]
]

{ #category : #'as yet unclassified' }
PyramidThemePropertyStrategy >> propertyForStamp: aStamp [

	| property |
	property := PyramidProperty new name: aStamp; command: (PyramidStampCommand new stamp: aStamp; yourself).
	^ property
]
