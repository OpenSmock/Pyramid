Trait {
	#name : #TPyEditorPanelTop,
	#traits : 'TPyramidBusinessUser',
	#classTraits : 'TPyramidBusinessUser classTrait',
	#category : #'Pyramid-Editor-Panels-Top'
}

{ #category : #'as yet unclassified' }
TPyEditorPanelTop >> <= aTPyEditorPanelTop [
	^ self order <= aTPyEditorPanelTop order
]

{ #category : #'as yet unclassified' }
TPyEditorPanelTop >> layoutBox [
	
	^ SpBoxLayout newHorizontal spacing: 4; yourself.
]

{ #category : #'as yet unclassified' }
TPyEditorPanelTop >> order [
	^ 0
]
