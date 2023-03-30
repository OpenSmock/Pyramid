Class {
	#name : #PyTopPanelSave,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelTopLeft',
	#classTraits : 'TPyEditorPanelTopLeft classTrait',
	#instVars : [
		'saveButton',
		'selectionButton',
		'plugin'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #initialization }
PyTopPanelSave >> business: aBusiness [

	business := aBusiness.
	plugin := aBusiness getPlugin: PyPluginHistory
]

{ #category : #layout }
PyTopPanelSave >> defaultLayout [

	| defaultLayout |
	defaultLayout := self layoutBox.
	PyTopPanelHelper addButton: self selectionButton toLayout: defaultLayout.
	PyTopPanelHelper addButton: self saveButton toLayout: defaultLayout.
	^ defaultLayout
]

{ #category : #initialization }
PyTopPanelSave >> initializePresenters [

	selectionButton := self newButton.
	selectionButton icon: (self iconNamed: #smallRemoteOpen); action: [ self selectionAction ].
	saveButton := self newButton.
	saveButton icon: (self iconNamed: #smallSave); action: [ self saveAction ].
]

{ #category : #accessing }
PyTopPanelSave >> order [

	^ 2
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> saveAction [
	
]

{ #category : #accessing }
PyTopPanelSave >> saveButton [

	^ saveButton
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> selectionAction [
	
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> selectionButton [

	^ selectionButton
]
