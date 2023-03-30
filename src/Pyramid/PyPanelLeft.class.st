Class {
	#name : #PyPanelLeft,
	#superclass : #PyPanelSide,
	#category : #'Pyramid-Editor'
}

{ #category : #'as yet unclassified' }
PyPanelLeft >> recoverSideViews [

	^ (PyEditorPanelLocator classPanelSideLeft collect: [ :each |
		  each new ]) asArray sorted
]
