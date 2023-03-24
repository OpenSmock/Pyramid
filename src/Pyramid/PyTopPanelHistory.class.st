Class {
	#name : #PyTopPanelHistory,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelTopLeft',
	#classTraits : 'TPyEditorPanelTopLeft classTrait',
	#instVars : [
		'undoButton',
		'redoButton'
	],
	#category : #'Pyramid-Plugin-History'
}

{ #category : #layout }
PyTopPanelHistory >> defaultLayout [

	| defaultLayout |
	defaultLayout := self layoutBox.
	PyTopPanelHelper addButton: self undoButton toLayout: defaultLayout.
	PyTopPanelHelper addButton: self redoButton toLayout: defaultLayout.
	^ defaultLayout
]

{ #category : #initialization }
PyTopPanelHistory >> initializePresenters [

	undoButton := self newButton.
	undoButton
		icon: (self iconNamed: #back);
		action: [ self undoAction ].
	redoButton := self newButton.
	redoButton
		icon: (self iconNamed: #forward);
		action: [ self redoAction ]
]

{ #category : #'as yet unclassified' }
PyTopPanelHistory >> order [
	^ 1
]

{ #category : #'as yet unclassified' }
PyTopPanelHistory >> redoAction [

	
]

{ #category : #accessing }
PyTopPanelHistory >> redoButton [

	^ redoButton
]

{ #category : #'as yet unclassified' }
PyTopPanelHistory >> undoAction [

	
]

{ #category : #accessing }
PyTopPanelHistory >> undoButton [

	^ undoButton
]
