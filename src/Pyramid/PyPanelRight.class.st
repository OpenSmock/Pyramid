Class {
	#name : #PyPanelRight,
	#superclass : #PyPanelSide,
	#category : #'Pyramid-Editor'
}

{ #category : #'as yet unclassified' }
PyPanelRight >> recoverSideViews [

	^ TPyEditorPanelRight users collect: [ :each | each new ]
]
