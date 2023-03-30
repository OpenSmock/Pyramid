Trait {
	#name : #TPyHistroyObserver,
	#instVars : [
		'history'
	],
	#category : #'Pyramid-Plugin-History'
}

{ #category : #accessing }
TPyHistroyObserver >> history [

	history ifNil: [
		history := PyCommandHistory new
			            addObserver: self;
			            yourself ].
	^ history
]

{ #category : #accessing }
TPyHistroyObserver >> history: aPyCommandHistory [

	self history removeObserver: self.
	history := aPyCommandHistory.
	history addObserver: self
]

{ #category : #'as yet unclassified' }
TPyHistroyObserver >> pyHistoryUpdated [

	self shouldBeImplemented
]
