Class {
	#name : #PyramidSelectorPossibleStamps,
	#superclass : #Object,
	#instVars : [
		'theme'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #'as yet unclassified' }
PyramidSelectorPossibleStamps >> findAllSelectorFor: aBlElement [

	^ self theme styleSheet styleRules flatCollect: [
		                     :rule |
		                     self findAllSelectorFor: aBlElement on: rule ].
]

{ #category : #'as yet unclassified' }
PyramidSelectorPossibleStamps >> findAllSelectorFor: aBlElement on: aToStyleRule [

	| interpreter |
	interpreter := PyramidContainsValidSelectorInterpreter new.
	interpreter check: aToStyleRule selector on: aBlElement.
	interpreter result
		ifTrue: [
			^ interpreter ignoredSelectors asArray
			  , (aToStyleRule styleRules flatCollect: [ :each |
					   self findAllSelectorFor: aBlElement on: each ]) ]
		ifFalse: [ ^ {  } ]
]

{ #category : #'as yet unclassified' }
PyramidSelectorPossibleStamps >> findAllStampsFor: aBlElement [

	| allValidSelectors allStampsSelectors |
	allValidSelectors := self findAllSelectorFor: aBlElement.
	allStampsSelectors := allValidSelectors select: [ :each |
		                      each class = ToStampSelector ].
	^ (allStampsSelectors flatCollect: [ :each | each allStamps ]) asSet
		  sorted
]

{ #category : #accessing }
PyramidSelectorPossibleStamps >> theme [

	^ theme
]

{ #category : #accessing }
PyramidSelectorPossibleStamps >> theme: anObject [

	theme := anObject
]
