Trait {
	#name : #TPyOpenStrategy,
	#category : #'Pyramid-Business-Open-Strategy'
}

{ #category : #'as yet unclassified' }
TPyOpenStrategy >> keybindingsOn: aWindow For: aBusiness [

	aWindow
		bindKeyCombination: $a alt
		toAction: [
		aBusiness selection selectChildren ]
]

{ #category : #protocol }
TPyOpenStrategy >> open: aBusiness [

	self setupRoots: aBusiness.
	self setupWindow: aBusiness.
]

{ #category : #protocol }
TPyOpenStrategy >> setupRoots: aBusiness [
]

{ #category : #protocol }
TPyOpenStrategy >> setupWindow: aBusiness [

	| window |
	window := aBusiness view open.
	window resize: 1024 @ 720.
	window title: 'Pyramid Editor'.
	window whenClosedDo: [ self whenWindowClosed: aBusiness ].
	self keybindingsOn: window For: aBusiness
]

{ #category : #'as yet unclassified' }
TPyOpenStrategy >> whenWindowClosed: aBusiness [

	
]
