Class {
	#name : #PyramidNumberInputPresenterTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-cases-property'
}

{ #category : #tests }
PyramidNumberInputPresenterTest >> testEmptyValue [

	| input |
	input := PyramidNumberInputPresenter new
		         value: 4;
		         yourself.

	self assert: input value equals: 4.
	input emptyValue.
	self assert: input value equals: nil
]

{ #category : #tests }
PyramidNumberInputPresenterTest >> testMixedValues [

	| input |
	input := PyramidNumberInputPresenter new
		         value: 4;
		         yourself.

	self assert: input value equals: 4.
	input mixedValues.
	self assert: input value equals: nil
]

{ #category : #tests }
PyramidNumberInputPresenterTest >> testValue [

	| input |
	input := PyramidNumberInputPresenter new yourself.

	self assert: input value equals: nil.
	input value: 4.
	self assert: input value equals: 4.
	input value: 10.
	self assert: input value equals: 10.
	input value: nil.
	self assert: input value equals: nil
]

{ #category : #tests }
PyramidNumberInputPresenterTest >> testWhenValueChangedDo [

	| input test |
	test := 0.
	input := PyramidNumberInputPresenter new whenValueChangedDo: [ :n |
		         test := n ].

	self assert: test equals: 0.
	input value: 4.
	self assert: test equals: 0.
	input inputNumber contextKeyBindings keymaps do: [:bind | bind action value].
	self assert: test equals: 4.
]
