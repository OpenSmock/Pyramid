Class {
	#name : #PyEditorPanelController,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Pyramid-Editor'
}

{ #category : #accessing }
PyEditorPanelController >> closeLeft [

	self model left: false
]

{ #category : #accessing }
PyEditorPanelController >> closeRight [

	self model right: false
]

{ #category : #accessing }
PyEditorPanelController >> model [

	^ model
]

{ #category : #accessing }
PyEditorPanelController >> model: aModel [

	model := aModel
]

{ #category : #accessing }
PyEditorPanelController >> openLeft [

	self model left: true
]

{ #category : #accessing }
PyEditorPanelController >> openRight [

	self model right: true
]
