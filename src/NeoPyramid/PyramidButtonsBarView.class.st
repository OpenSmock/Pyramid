Class {
	#name : #PyramidButtonsBarView,
	#superclass : #SpPresenter,
	#instVars : [
		'buttonsConstraintsStart',
		'buttonsConstraintsCenter',
		'buttonsConstraintsEnd',
		'boxLayout'
	],
	#category : #NeoPyramid
}

{ #category : #adding }
PyramidButtonsBarView >> addButtonCenter: aSpButtonPresenter withConstraints: aBlock [

	self buttonsConstraintsCenter add: aSpButtonPresenter -> aBlock
]

{ #category : #adding }
PyramidButtonsBarView >> addButtonEnd: aSpButtonPresenter withConstraints: aBlock [

	self buttonsConstraintsEnd add: aSpButtonPresenter -> aBlock
]

{ #category : #adding }
PyramidButtonsBarView >> addButtonStart: aSpButtonPresenter withConstraints: aBlock [

	self buttonsConstraintsStart add: aSpButtonPresenter -> aBlock
]

{ #category : #'as yet unclassified' }
PyramidButtonsBarView >> boxLayout [

	boxLayout ifNil: [ boxLayout := SpBoxLayout newLeftToRight
		  spacing: 4;
		  hAlignEnd;
		  yourself ].
	^ boxLayout
]

{ #category : #'as yet unclassified' }
PyramidButtonsBarView >> boxLayout: aSpBoxLayout [

	boxLayout := aSpBoxLayout
]

{ #category : #accessing }
PyramidButtonsBarView >> buttonsConstraintsCenter [

	^ buttonsConstraintsCenter
]

{ #category : #accessing }
PyramidButtonsBarView >> buttonsConstraintsEnd [

	^ buttonsConstraintsEnd
]

{ #category : #accessing }
PyramidButtonsBarView >> buttonsConstraintsStart [
	^ buttonsConstraintsStart
]

{ #category : #layout }
PyramidButtonsBarView >> defaultLayout [

	| defaultLayout startDefaultLayout centerDefaultLayout endDefaultLayout |
	defaultLayout := self boxLayout.

	startDefaultLayout := self boxLayout.
	centerDefaultLayout := self boxLayout.
	endDefaultLayout := self boxLayout.

	defaultLayout
		add: startDefaultLayout expand: true;
		add: centerDefaultLayout expand: true;
		add: endDefaultLayout expand: true.

	self buttonsConstraintsStart do: [ :each |
		startDefaultLayout add: each key withConstraints: each value ].
	startDefaultLayout add: SpNullPresenter new expand: true.
	centerDefaultLayout add: SpNullPresenter new expand: true.
	self buttonsConstraintsCenter do: [ :each |
		centerDefaultLayout add: each key withConstraints: each value ].
	centerDefaultLayout add: SpNullPresenter new expand: true.
	endDefaultLayout add: SpNullPresenter new expand: true.
	self buttonsConstraintsEnd do: [ :each |
		endDefaultLayout add: each key withConstraints: each value ].

	
	^ defaultLayout
]

{ #category : #initialization }
PyramidButtonsBarView >> initializePresenters [

	buttonsConstraintsStart  := OrderedCollection new.buttonsConstraintsCenter := OrderedCollection new. buttonsConstraintsEnd := OrderedCollection new.
]

{ #category : #adding }
PyramidButtonsBarView >> updateLayout [

	self layout: self defaultLayout
]
