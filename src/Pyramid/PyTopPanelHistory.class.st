Class {
	#name : #PyTopPanelHistory,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelTopLeft + TPyHistroyObserver',
	#classTraits : 'TPyEditorPanelTopLeft classTrait + TPyHistroyObserver classTrait',
	#instVars : [
		'undoButton',
		'redoButton'
	],
	#category : #'Pyramid-Plugin-History'
}

{ #category : #initialization }
PyTopPanelHistory >> business: aBusiness [

	business := aBusiness.
	self history: (aBusiness getPlugin: PyPluginHistory) history.
]

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
		action: [ self undoAction ];
		enabled: false.
	redoButton := self newButton.
	redoButton
		icon: (self iconNamed: #forward);
		action: [ self redoAction ];
		enabled: false.
]

{ #category : #'as yet unclassified' }
PyTopPanelHistory >> order [
	^ 1
]

{ #category : #'as yet unclassified' }
PyTopPanelHistory >> pyHistoryUpdated [

	self history mementos ifEmpty: [
		self undoButton enabled: false.
		self redoButton enabled: false.
		^ self ].
	self undoButton enabled: true.
]

{ #category : #'as yet unclassified' }
PyTopPanelHistory >> redoAction [

	
]

{ #category : #accessing }
PyTopPanelHistory >> redoButton [

	^ redoButton
]

{ #category : #accessing }
PyTopPanelHistory >> selection [
	^ self business selection
]

{ #category : #'as yet unclassified' }
PyTopPanelHistory >> undoAction [

	self history undo.
	self selection notifyObservers
]

{ #category : #accessing }
PyTopPanelHistory >> undoButton [

	^ undoButton
]
