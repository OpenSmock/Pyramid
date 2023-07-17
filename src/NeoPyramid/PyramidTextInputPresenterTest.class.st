Class {
	#name : #PyramidTextInputPresenterTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-cases-property'
}

{ #category : #tests }
PyramidTextInputPresenterTest >> testEmptyValue [

	| input |
	input := PyramidTextInputPresenter new
		         value: 'hello';
		         yourself.

	self assert: input value equals: 'hello'.
	input emptyValue.
	self assert: input value equals: '# empty value'
]

{ #category : #tests }
PyramidTextInputPresenterTest >> testMixedValues [

	| input |
	input := PyramidTextInputPresenter new
		         value: 'hello';
		         yourself.

	self assert: input value equals: 'hello'.
	input mixedValues.
	self assert: input value equals: '# mixed values'
]

{ #category : #tests }
PyramidTextInputPresenterTest >> testValue [

	| input |
	input := PyramidTextInputPresenter new yourself.

	self assert: input value equals: ''.
	input value: 'hello'.
	self assert: input value equals: 'hello'.
	input value: 'world'.
	self assert: input value equals: 'world'.
	input value: ''.
	self assert: input value equals: ''
]

{ #category : #tests }
PyramidTextInputPresenterTest >> testWhenValueChangedDo [

	| input test |
	test := ''.
	input := PyramidTextInputPresenter new whenValueChangedDo: [ :n |
		         test := n ].

	self assert: test equals: ''.
	input value: 'hello'.
	self assert: test equals: ''.
	input textInput contextKeyBindings keymaps do: [ :bind |
		bind action value ].
	self assert: test equals: 'hello'
]
