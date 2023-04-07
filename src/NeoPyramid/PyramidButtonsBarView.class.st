Class {
	#name : #PyramidButtonsBarView,
	#superclass : #SpPresenter,
	#instVars : [
		'buttonsConstraintsStart',
		'buttonsConstraintsCenter',
		'buttonsConstraintsEnd',
		'boxLayout'
	],
	#category : #'NeoPyramid-views'
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

	| spacing defaultLayout startDefaultLayout centerDefaultLayout endDefaultLayout |
	spacing := self boxLayout spacing.
	self boxLayout isHorizontal
		ifTrue: [
			defaultLayout := SpBoxLayout newHorizontal.
			startDefaultLayout := SpBoxLayout newHorizontal
				                      spacing: spacing;
				                      yourself.
			centerDefaultLayout := SpBoxLayout newHorizontal
				                       spacing: spacing;
				                       yourself.
			endDefaultLayout := SpBoxLayout newHorizontal
				                    spacing: spacing;
				                    yourself ]
		ifFalse: [
			defaultLayout := SpBoxLayout newVertical.
			startDefaultLayout := SpBoxLayout newVertical
				                      spacing: spacing;
				                      yourself.
			centerDefaultLayout := SpBoxLayout newVertical
				                       spacing: spacing;
				                       yourself.
			endDefaultLayout := SpBoxLayout newVertical
				                    spacing: spacing;
				                    yourself ].

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
