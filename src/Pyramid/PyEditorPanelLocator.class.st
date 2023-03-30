Class {
	#name : #PyEditorPanelLocator,
	#superclass : #Object,
	#category : #'Pyramid-Editor'
}

{ #category : #'as yet unclassified' }
PyEditorPanelLocator class >> classPanelProperties [

	^ TPyPropertyChanger users 
]

{ #category : #'as yet unclassified' }
PyEditorPanelLocator class >> classPanelSideLeft [

	^ TPyEditorPanelLeft users
]

{ #category : #'as yet unclassified' }
PyEditorPanelLocator class >> classPanelSideRight [
	^ TPyEditorPanelRight users
]

{ #category : #'as yet unclassified' }
PyEditorPanelLocator class >> classPanelTopLeft [
	^ TPyEditorPanelTopLeft users
]

{ #category : #'as yet unclassified' }
PyEditorPanelLocator class >> classPanelTopRight [

	^ TPyEditorPanelTopRight users
]

{ #category : #'as yet unclassified' }
PyEditorPanelLocator class >> classPanelTreeColumns [

	^ TPyTreeColumn users
]

{ #category : #'see class side' }
PyEditorPanelLocator >> seeClassSide [
]
