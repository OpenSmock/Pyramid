Trait {
	#name : #TPyEditorPanelSide,
	#traits : 'TPyramidBusinessUser',
	#classTraits : 'TPyramidBusinessUser classTrait',
	#category : #'Pyramid-Editor'
}

{ #category : #comparing }
TPyEditorPanelSide >> <= aTPyEditorPanelSide [

	^ self order <= aTPyEditorPanelSide order
]

{ #category : #converting }
TPyEditorPanelSide >> asNotebookPage [

	^ SpNotebookPage
		  title: self class pageTitle
		  icon: self class  pageIcon
		  provider: [ self ]
]

{ #category : #accessing }
TPyEditorPanelSide >> order [

	^ 0
]
