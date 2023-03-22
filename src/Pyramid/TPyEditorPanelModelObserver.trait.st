Trait {
	#name : #TPyEditorPanelModelObserver,
	#instVars : [
		'model'
	],
	#category : #'Pyramid-Editor'
}

{ #category : #accessing }
TPyEditorPanelModelObserver >> model [
	^ model
]

{ #category : #initialization }
TPyEditorPanelModelObserver >> model: aModel [

	model := aModel.
	model addObserver: self.

]

{ #category : #initialization }
TPyEditorPanelModelObserver >> pyEditorPanelModelChange [

	self shouldBeImplemented
]
