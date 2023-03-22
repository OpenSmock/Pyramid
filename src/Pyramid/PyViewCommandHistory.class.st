Class {
	#name : #PyViewCommandHistory,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelRight',
	#classTraits : 'TPyEditorPanelRight classTrait',
	#instVars : [
		'properties'
	],
	#category : #'Pyramid-Editor-Side-Panel'
}

{ #category : #accessing }
PyViewCommandHistory class >> pageIcon [

	^ self iconNamed: #history
]

{ #category : #accessing }
PyViewCommandHistory class >> pageTitle [

	^ 'History'
]

{ #category : #layout }
PyViewCommandHistory >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical.
	defaultLayout
		add: (SpMorphPresenter new morph: (Morph new color: Color random))
		expand: true;
		yourself.
	^ defaultLayout
]
