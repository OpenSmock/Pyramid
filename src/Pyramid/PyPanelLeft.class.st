Class {
	#name : #PyPanelLeft,
	#superclass : #PyPanelSide,
	#category : #'Pyramid-Editor'
}

{ #category : #'as yet unclassified' }
PyPanelLeft >> recoverSideViews [

	^TPyEditorPanelLeft users collect: [ :each | each new ].
]
