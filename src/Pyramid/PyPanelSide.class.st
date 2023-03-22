Class {
	#name : #PyPanelSide,
	#superclass : #SpPresenter,
	#traits : 'TPyramidBusinessUser',
	#classTraits : 'TPyramidBusinessUser classTrait',
	#instVars : [
		'notebook',
		'views'
	],
	#category : #'Pyramid-Editor'
}

{ #category : #initialization }
PyPanelSide >> business: aBusiness [

	business := aBusiness.
	self views do: [ :each | each business: aBusiness ]
]

{ #category : #'as yet unclassified' }
PyPanelSide >> createNotebookPages [

	self views do: [ :each | self notebook addPage: each asNotebookPage ]
]

{ #category : #layout }
PyPanelSide >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: self notebook;
		  yourself
]

{ #category : #initialization }
PyPanelSide >> initializePresenters [

	notebook := SpNotebookPresenter new.
	self createNotebookPages
]

{ #category : #layout }
PyPanelSide >> notebook [

	^ notebook
]

{ #category : #'as yet unclassified' }
PyPanelSide >> recoverSideViews [

	^ self shouldBeImplemented 
]

{ #category : #accessing }
PyPanelSide >> views [

	views ifNil: [ views := self recoverSideViews ].
	^ views
]
