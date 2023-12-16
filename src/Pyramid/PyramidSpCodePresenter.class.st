Class {
	#name : #PyramidSpCodePresenter,
	#superclass : #SpCodePresenter,
	#category : #'Pyramid-plugin-selection'
}

{ #category : #'command support' }
PyramidSpCodePresenter >> evaluate: aString onCompileError: compileErrorBlock onError: errorBlock [

	| result |
	result := super
		          evaluate: aString
		          onCompileError: compileErrorBlock
		          onError: errorBlock.
	self projectModel informElementsChanged.
	^ result
]

{ #category : #accessing }
PyramidSpCodePresenter >> initialize [

	super initialize.
	self interactionModel: PyramidSpCodeObjectInteractionModel new.
]

{ #category : #accessing }
PyramidSpCodePresenter >> projectModel [

	^ self interactionModel projectModel
]

{ #category : #accessing }
PyramidSpCodePresenter >> projectModel: aPyramidActiveProject [

	self interactionModel projectModel: aPyramidActiveProject
]
