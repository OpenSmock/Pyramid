Class {
	#name : #PyPanelRight,
	#superclass : #PyPanelSide,
	#category : #'Pyramid-Editor'
}

{ #category : #'as yet unclassified' }
PyPanelRight >> recoverSideViews [

	^ (PyEditorPanelLocator classPanelSideRight collect: [ :each |
		  each new ]) asArray sorted
]
