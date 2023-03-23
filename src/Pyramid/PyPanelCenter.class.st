Class {
	#name : #PyPanelCenter,
	#superclass : #SpPresenter,
	#traits : 'TPyramidBusinessUser',
	#classTraits : 'TPyramidBusinessUser classTrait',
	#instVars : [
		'space',
		'view'
	],
	#category : #'Pyramid-Editor'
}

{ #category : #initialization }
PyPanelCenter >> business: aBusiness [

	business := aBusiness.
	self roots: business roots.
]

{ #category : #layout }
PyPanelCenter >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newLeftToRight.
	defaultLayout add: self view expand: true.
	^ defaultLayout
]

{ #category : #initialization }
PyPanelCenter >> initializeNewMorphicSpace [

	| host morph |
	morph := Morph new.
	morph layoutPolicy: TableLayout new.

	host := PyMorphicAlexandrieHost new.
	host containerMorph: morph.

	space := BlSpace new.
	space host: host.

	self whenBuiltDo: [ space show ].

	^ morph
]

{ #category : #initialization }
PyPanelCenter >> initializePresenters [

	view := self newMorph.
	view morph: self initializeNewMorphicSpace
]

{ #category : #'as yet unclassified' }
PyPanelCenter >> originLayer [
	^ self space root
]

{ #category : #api }
PyPanelCenter >> roots: aPyRoots [

	self originLayer removeChildren.
	self originLayer addChildren: aPyRoots elements
]

{ #category : #'as yet unclassified' }
PyPanelCenter >> space [
	^ space
]

{ #category : #'as yet unclassified' }
PyPanelCenter >> view [
	^ view
]
