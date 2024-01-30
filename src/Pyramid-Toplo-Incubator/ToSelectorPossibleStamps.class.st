Class {
	#name : #ToSelectorPossibleStamps,
	#superclass : #Object,
	#instVars : [
		'theme'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #'as yet unclassified' }
ToSelectorPossibleStamps >> findPossibleStampsFor: aBlElement [

	^ self theme styleSheet styleRules flatCollect: [ :rule |
		  self findPossibleStampsFor: aBlElement on: rule ]
]

{ #category : #'as yet unclassified' }
ToSelectorPossibleStamps >> findPossibleStampsFor: aBlElement on: aToStyleRule [

	| interpreter |
	interpreter := ToSelectorInterpreter new.
	interpreter check: aToStyleRule selector on: aBlElement.
	interpreter result
		ifTrue: [
			^ aToStyleRule styleRules flatCollect: [ :each |
				  self findPossibleStampsFor: aBlElement on: each ] ]
		ifFalse: [ ^ { aToStyleRule selector } ]
]

{ #category : #accessing }
ToSelectorPossibleStamps >> theme [

	^ theme
]

{ #category : #accessing }
ToSelectorPossibleStamps >> theme: anObject [

	theme := anObject
]
