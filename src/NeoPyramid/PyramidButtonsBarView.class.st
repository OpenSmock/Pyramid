Class {
	#name : #PyramidButtonsBarView,
	#superclass : #SpPresenter,
	#instVars : [
		'buttonsConstraintsStart',
		'buttonsConstraintsCenter',
		'buttonsConstraintsEnd',
		'isHorizontal',
		'spacing',
		'builder'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #adding }
PyramidButtonsBarView >> addAllButtons: aCollection [

	aCollection do: [ :each | self builder makeButtonFrom: each for: self ]
]

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

{ #category : #accessing }
PyramidButtonsBarView >> beHorizontal [

	isHorizontal := true
]

{ #category : #accessing }
PyramidButtonsBarView >> beVertical [

	isHorizontal := false
]

{ #category : #accessing }
PyramidButtonsBarView >> builder [
	^ builder
]

{ #category : #accessing }
PyramidButtonsBarView >> builder: aBuilder [

	builder := aBuilder
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
	self isHorizontal
		ifTrue: [
			defaultLayout := SpBoxLayout newHorizontal.
			startDefaultLayout := SpBoxLayout newHorizontal
				                      spacing: self spacing;
				                      yourself.
			centerDefaultLayout := SpBoxLayout newHorizontal
				                       spacing: self spacing;
				                       yourself.
			endDefaultLayout := SpBoxLayout newHorizontal
				                    spacing: self spacing;
				                    yourself ]
		ifFalse: [
			defaultLayout := SpBoxLayout newVertical.
			startDefaultLayout := SpBoxLayout newVertical
				                      spacing: self spacing;
				                      yourself.
			centerDefaultLayout := SpBoxLayout newVertical
				                       spacing: self spacing;
				                       yourself.
			endDefaultLayout := SpBoxLayout newVertical
				                    spacing: self spacing;
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

{ #category : #accessing }
PyramidButtonsBarView >> isHorizontal [

	isHorizontal ifNil: [ isHorizontal := true ].
	^ isHorizontal
]

{ #category : #accessing }
PyramidButtonsBarView >> spacing [

	spacing ifNil: [ spacing := 0 ].
	^ spacing
]

{ #category : #accessing }
PyramidButtonsBarView >> spacing: aNumber [

	spacing := aNumber
]

{ #category : #adding }
PyramidButtonsBarView >> updateLayout [

	self layout: self defaultLayout
]
