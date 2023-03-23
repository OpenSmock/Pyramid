Trait {
	#name : #TPySelectionObserver,
	#instVars : [
		'selection'
	],
	#category : #'Pyramid-Business'
}

{ #category : #'as yet unclassified' }
TPySelectionObserver >> pySelectionChanged [

	self shouldBeImplemented 
]

{ #category : #accessing }
TPySelectionObserver >> selection [

	selection ifNil: [ selection := PySelection new addObserver: self; yourself ].
	^ selection
]

{ #category : #accessing }
TPySelectionObserver >> selection: aPySelection [

	self selection removeObserver: self.
	selection := aPySelection.
	selection addObserver: self
]
