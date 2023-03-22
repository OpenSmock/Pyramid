Class {
	#name : #PyPanelTop,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelModelObserver + TPyramidBusinessUser',
	#classTraits : 'TPyEditorPanelModelObserver classTrait + TPyramidBusinessUser classTrait',
	#instVars : [
		'controller',
		'menuLeft',
		'menuRight',
		'pluggins',
		'model'
	],
	#category : #'Pyramid-Editor'
}

{ #category : #accessing }
PyPanelTop >> controller [
	^ controller
]

{ #category : #accessing }
PyPanelTop >> controller: aPyEditorPanelController [ 

	controller := aPyEditorPanelController
]

{ #category : #layout }
PyPanelTop >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newLeftToRight.
	defaultLayout add: self menuLeft withConstraints: [ :c |
		c height: 40.
		c width: 40 ].
	defaultLayout add: SpNullPresenter new expand: true fill: true.
	defaultLayout add: self menuRight withConstraints: [ :c |
		c height: 40.
		c width: 40 ].
	^ defaultLayout
]

{ #category : #'as yet unclassified' }
PyPanelTop >> initializePresenters [

	menuLeft := self newButton.
	menuLeft icon: (self iconNamed: #solidMenu).
	menuLeft action: [ self controller inverseLeft ].


	menuRight := self newButton.
	menuRight icon: (self iconNamed: #solidMenu).
	menuRight action: [ self controller inverseRight ]
]

{ #category : #accessing }
PyPanelTop >> menuLeft [
	^ menuLeft
]

{ #category : #accessing }
PyPanelTop >> menuRight [

	^ menuRight
]

{ #category : #initialization }
PyPanelTop >> pyEditorPanelModelChange [

	self model isLeftOpen
		ifTrue: [ self menuLeft color: (Color fromHexString: #afd5fa) ]
		ifFalse: [ self menuLeft color: (Color fromHexString: #e6e6e6) ].
	self model isRightOpen
		ifTrue: [ self menuRight color: (Color fromHexString: #afd5fa) ]
		ifFalse: [ self menuRight color: (Color fromHexString: #e6e6e6) ]
]
