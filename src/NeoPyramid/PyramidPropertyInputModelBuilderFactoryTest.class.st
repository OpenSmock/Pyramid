Class {
	#name : #PyramidPropertyInputModelBuilderFactoryTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #tests }
PyramidPropertyInputModelBuilderFactoryTest >> testIdentifierTextInput [

	| property inputModel |
	property := PyramidProperty new.
	PyramidPropertyInputModelBuilderFactory identifierTextInput
		installBuilderOn: property.
	inputModel := property inputBuilder build.
	self assert: inputModel elementInputModel size equals: 0
]

{ #category : #tests }
PyramidPropertyInputModelBuilderFactoryTest >> testMockPresenter [

	| property inputModel |
	property := PyramidProperty new.
	PyramidPropertyInputModelBuilderFactory mockPresenter
		installBuilderOn: property.
	inputModel := property inputBuilder build.
	self assert: inputModel elementInputModel size equals: 0
]

{ #category : #tests }
PyramidPropertyInputModelBuilderFactoryTest >> testVisibilityDropList [

	| property inputModel |
	property := PyramidProperty new.
	PyramidPropertyInputModelBuilderFactory visibilityDropList
		installBuilderOn: property.
	inputModel := property inputBuilder build.
	self assert: inputModel elementInputModel size equals: 0
]
