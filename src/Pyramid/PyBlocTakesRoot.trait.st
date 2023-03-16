Trait {
	#name : #PyBlocTakesRoot,
	#instVars : [
		'root'
	],
	#category : #'Pyramid-Utilities'
}

{ #category : #accessing }
PyBlocTakesRoot >> root [

	^ root
]

{ #category : #accessing }
PyBlocTakesRoot >> root: aBlElement [

	root := aBlElement.
	self whenRootChanged
]

{ #category : #'as yet unclassified' }
PyBlocTakesRoot >> whenRootChanged [

	self shouldBeImplemented
]
