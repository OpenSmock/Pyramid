Trait {
	#name : #TPyEditorPanelSide,
	#traits : 'TPyramidBusinessUser',
	#classTraits : 'TPyramidBusinessUser classTrait',
	#category : #'Pyramid-Editor'
}

{ #category : #converting }
TPyEditorPanelSide classSide >> asNotebookPage [

	^ SpNotebookPage
		  title: self pageTitle
		  icon: self pageIcon
		  provider: [ self new ]
]

{ #category : #converting }
TPyEditorPanelSide >> asNotebookPage [

	^ SpNotebookPage
		  title: self class pageTitle
		  icon: self class  pageIcon
		  provider: [ self ]
]
