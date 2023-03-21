Class {
	#name : #PyEditorPresenter,
	#superclass : #SpPresenter,
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

	editorLayoutStrategy ifNil: [ self modelChanged ].
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

	panelTop := PyPanelTop new controller: self controller.
	panelCenter := PyPanelCenter new.
	panelLeft := PyPanelSide new.
	panelRight := PyPanelSide new
]

{ #category : #accessing }
PyEditorPresenter >> model [
	^ model
]

{ #category : #initialization }
PyEditorPresenter >> model: aModel [

	model := aModel.
	model addObserver: self.

	self when: #pyEditorPanelModelChange evaluate: [
		self modelChanged.
		self layout: self defaultLayout ]
]

{ #category : #initialization }
PyEditorPresenter >> modelChanged [

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
			 right: self panelRight).
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
