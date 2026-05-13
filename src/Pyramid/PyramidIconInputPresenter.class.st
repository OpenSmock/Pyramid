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

{ #category : #initialization }
PyramidIconInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :v |  ].
	list := SpFilteringListPresenter new.
	list items:
		Smalltalk ui icons allIconNames asSortedCollection asArray.
	list display: [ :name | name ].
	list displayIcon: [ :name | Smalltalk ui icons iconNamed: name ].
	textInput := SpTextInputFieldPresenter new.
	textInput whenSubmitDo: [ :text | whenValueChangedDo value: text ].
	button := SpButtonPresenter new
		          help: 'Select an icon';
		          icon: (Smalltalk ui icons iconNamed: #image);
		          action: [ self openIconModal ];
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
