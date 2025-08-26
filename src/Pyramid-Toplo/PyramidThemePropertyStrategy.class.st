Class {
	#name : #PyramidThemePropertyStrategy,
	#superclass : #PyramidHideEmptyPropertyStrategy,
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #'as yet unclassified' }
PyramidThemePropertyStrategy >> propertiesFor: anElement [

	| elementWithStyleSheetTheme allPossibleStamps |
	
	elementWithStyleSheetTheme := (anElement isAttachedToSceneGraph and: [
			                               anElement lookupTheme isKindOf:
				                               ToStyleSheetTheme ]) ifTrue: [ anElement ].
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
