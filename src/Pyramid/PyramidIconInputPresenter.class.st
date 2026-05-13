Class {
	#name : #PyramidIconInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'textInput',
		'button',
		'list',
		'whenValueChangedDo'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #layout }
PyramidIconInputPresenter >> defaultLayout [
    ^ SpBoxLayout newHorizontal
        spacing: 2;
        add: textInput;
        add: button width: 24;
        yourself
]

{ #category : #'as yet unclassified' }
PyramidIconInputPresenter >> openIconModal [

	| window dialog |
	window := list asModalWindow.
	window title: 'Choose an icon'.
	window centered.
	dialog := window open.
	dialog isOk ifFalse: [ ^ self ].
	self value: list selectedItem.
	whenValueChangedDo value: list selectedItem
]

{ #category : #'as yet unclassified' }
PyramidIconInputPresenter >> value [
    ^ textInput text
]

{ #category : #'as yet unclassified' }
PyramidIconInputPresenter >> value: aString [
    textInput text: (aString ifNil: [''])
]

{ #category : #'as yet unclassified' }
PyramidIconInputPresenter >> whenValueChangedDo: aBlock [
    whenValueChangedDo := aBlock
]
