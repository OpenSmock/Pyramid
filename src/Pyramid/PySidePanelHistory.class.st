Class {
	#name : #PySidePanelHistory,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelRight',
	#classTraits : 'TPyEditorPanelRight classTrait',
	#instVars : [
		'properties',
		'plugin'
	],
	#category : #'Pyramid-Plugin-History'
}

{ #category : #accessing }
PySidePanelHistory class >> pageIcon [

	^ self iconNamed: #history
]

{ #category : #accessing }
PySidePanelHistory class >> pageTitle [

	^ 'History'
]

{ #category : #initialization }
PySidePanelHistory >> business: aBusiness [

	business := aBusiness.
	plugin := aBusiness getPlugin: PyPluginHistory.
]

{ #category : #layout }
PySidePanelHistory >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical.
	defaultLayout
		add: (SpMorphPresenter new morph: (Morph new color: Color random))
		expand: true;
		yourself.
	^ defaultLayout
]

{ #category : #accessing }
PySidePanelHistory >> order [

	^ 10
]
