Class {
	#name : #PyPanelTop,
	#superclass : #SpPresenter,
	#traits : 'TPyramidBusinessUser + TPyEditorPanelModelObserver',
	#classTraits : 'TPyramidBusinessUser classTrait + TPyEditorPanelModelObserver classTrait',
	#instVars : [
		'controller',
		'menuRight',
		'pluggins',
		'menuLeft',
		'model',
		'viewsLeft',
		'viewsRight'
	],
	#category : #'Pyramid-Editor'
}

{ #category : #initialization }
PyPanelTop >> business: aBusiness [

	business := aBusiness.
	self viewsLeft do: [ :each | each business: aBusiness ].
	self viewsRight do: [ :each | each business: aBusiness ]
]

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
	defaultLayout := SpBoxLayout newLeftToRight spacing: 4.
	PyTopPanelHelper addButton: self menuLeft toLayout: defaultLayout.
	self layoutExtension: defaultLayout.
	PyTopPanelHelper addButton: self menuRight toLayout: defaultLayout.
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

{ #category : #'as yet unclassified' }
PyPanelTop >> layoutExtension: aLayout [

	self viewsLeft do: [ :each | aLayout add: each expand: false ].
	aLayout add: SpNullPresenter new expand: true.
	self viewsRight do: [ :each | aLayout add: each expand: false ].
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
PyPanelTop >> model: aModel [

	model := aModel.
	model addObserver: self.
	self pyEditorPanelModelChange 
]

{ #category : #'accessing - structure variables' }
PyPanelTop >> modelChanged [

	self model isLeftOpen
		ifTrue: [ self menuLeft color: (Color fromHexString: #afd5fa) ]
		ifFalse: [ self menuLeft color: (Color fromHexString: #e6e6e6) ].
	self model isRightOpen
		ifTrue: [ self menuRight color: (Color fromHexString: #afd5fa) ]
		ifFalse: [ self menuRight color: (Color fromHexString: #e6e6e6) ]
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

{ #category : #accessing }
PyPanelTop >> viewsLeft [

	viewsLeft ifNil: [
		viewsLeft := (TPyEditorPanelTopLeft users collect: [ :class |
			              class new ]) asArray sorted ].
	^ viewsLeft
]

{ #category : #accessing }
PyPanelTop >> viewsRight [

	viewsRight ifNil: [
		viewsRight := (TPyEditorPanelTopRight users collect: [ :class |
			               class new ]) asArray sorted ].
	^ viewsRight
]
