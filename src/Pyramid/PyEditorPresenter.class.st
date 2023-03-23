Class {
	#name : #PyEditorPresenter,
	#superclass : #SpPresenter,
	#traits : 'TPyramidBusinessUser + TPyEditorPanelModelObserver',
	#classTraits : 'TPyramidBusinessUser classTrait + TPyEditorPanelModelObserver classTrait',
	#instVars : [
		'panelTop',
		'panelLeft',
		'panelRight',
		'panelCenter',
		'model',
		'editorLayoutStrategy',
		'controller'
	],
	#category : #'Pyramid-Editor'
}

{ #category : #initialization }
PyEditorPresenter >> business: aBusiness [

	business := aBusiness.
	panelTop business: aBusiness.
	panelLeft business: aBusiness.
	panelRight business: aBusiness.
	panelCenter business: aBusiness.
	
]

{ #category : #accessing }
PyEditorPresenter >> controller [

	controller ifNil: [ controller := PyEditorPanelController new ].
	^ controller
]

{ #category : #accessing }
PyEditorPresenter >> controller: aPyEditorPanelController [

	controller := aPyEditorPanelController.
	controller model: self model
]

{ #category : #layout }
PyEditorPresenter >> defaultLayout [

	^ self editorLayoutStrategy layout
]

{ #category : #accessing }
PyEditorPresenter >> editorLayoutStrategy [

	editorLayoutStrategy ifNil: [ self strategyFromModel ].
	^ editorLayoutStrategy
]

{ #category : #accessing }
PyEditorPresenter >> editorLayoutStrategy: aStrategy [
	
	editorLayoutStrategy := aStrategy
]

{ #category : #initialization }
PyEditorPresenter >> initializePresenters [

	self model: PyEditorPanelModel new.
	self controller: PyEditorPanelController new.

	panelTop := PyPanelTop new
		            model: self model;
		            controller: self controller;
		            yourself.
	panelCenter := PyPanelCenter new.
	panelLeft := PyPanelLeft new.
	panelRight := PyPanelRight new
]

{ #category : #initialization }
PyEditorPresenter >> model: aModel [

	model := aModel.
	model addObserver: self.

	self when: #pyEditorPanelModelChange evaluate: [
		self modelChanged ]
]

{ #category : #initialization }
PyEditorPresenter >> modelChanged [

	| strategy |
	strategy := self strategyFromModel.
	self layout: self defaultLayout
	
]

{ #category : #accessing }
PyEditorPresenter >> panelCenter [

	^ panelCenter
]

{ #category : #accessing }
PyEditorPresenter >> panelLeft [

	^ panelLeft
]

{ #category : #accessing }
PyEditorPresenter >> panelRight [

	^ panelRight
]

{ #category : #accessing }
PyEditorPresenter >> panelTop [

	^ panelTop
]

{ #category : #initialization }
PyEditorPresenter >> pyEditorPanelModelChange [

	| strategy |
	strategy := self strategyFromModel.
	self layout: self defaultLayout
]

{ #category : #initialization }
PyEditorPresenter >> strategyFromModel [

	| strategy |
	strategy := self model isLeftOpen
		            ifTrue: [
			            self model isRightOpen
				            ifTrue: [ PyEditorLayoutStrategyCenterBoth ]
				            ifFalse: [ PyEditorLayoutStrategyCenterLeft ] ]
		            ifFalse: [
			            self model isRightOpen
				            ifTrue: [ PyEditorLayoutStrategyCenterRight ]
				            ifFalse: [ PyEditorLayoutStrategyCenter ] ].

	self editorLayoutStrategy: (strategy
			 center: self panelCenter
			 top: self panelTop
			 left: self panelLeft
			 right: self panelRight)
]
