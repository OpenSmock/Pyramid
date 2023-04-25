Trait {
	#name : #TPyramidHistory,
	#instVars : [
		'observers'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #adding }
TPyramidHistory >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #notifying }
TPyramidHistory >> informCounterReset [

	self observers do: [ :observer | observer pyramidHistoryCounterReset ]
]

{ #category : #notifying }
TPyramidHistory >> informRedo [

	self observers do: [ :observer |
		observer pyramidHistoryRedo ]
]

{ #category : #notifying }
TPyramidHistory >> informUndo [

	self observers do: [ :observer | observer pyramidHistoryUndo ]
]

{ #category : #adding }
TPyramidHistory >> observers [ 

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPyramidHistory >> removeObserver: anObserver [

	self observers remove: anObserver ifAbsent: [  ]
]
