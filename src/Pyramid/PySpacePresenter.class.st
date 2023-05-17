Class {
	#name : #PySpacePresenter,
	#superclass : #SpPresenter,
	#traits : 'PyBlocTakesRoot',
	#classTraits : 'PyBlocTakesRoot classTrait',
	#instVars : [
		'space',
		'viewPresenter'
	],
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Views-Space'
}

{ #category : #layout }
PySpacePresenter >> defaultLayout [ 

	^SpBoxLayout newTopToBottom add: #viewPresenter; yourself.
]

{ #category : #initialization }
PySpacePresenter >> initializeLayers [
]

{ #category : #initialization }
PySpacePresenter >> initializePresenters [

	self whenBuiltDo: [ space show ].
	viewPresenter := self initializeSpace.
	self initializeLayers
]

{ #category : #initialization }
PySpacePresenter >> initializeSpace [

	| host morph specContainer |
	morph := Morph new.
	morph layoutPolicy: TableLayout new.

	host := PyramidMorphicAlexandrieHost new.
	host containerMorph: morph.

	space := BlSpace new.
	space host: host.

	specContainer := self newMorph.
	specContainer morph: morph.
	
^specContainer
]

{ #category : #accessing }
PySpacePresenter >> root: aBlElement [

	self root ifNotNil: [ self rootRemoveOld ].
	root := aBlElement.
	self whenRootChanged
]

{ #category : #'as yet unclassified' }
PySpacePresenter >> rootAddNew [

	self rootLayer addChild: self root
]

{ #category : #'as yet unclassified' }
PySpacePresenter >> rootLayer [

	^ space
]

{ #category : #accessing }
PySpacePresenter >> rootRemoveOld [

	self rootLayer removeChild: self root
]

{ #category : #accessing }
PySpacePresenter >> space [ 

	^ space
]

{ #category : #'as yet unclassified' }
PySpacePresenter >> whenRootChanged [

	self rootAddNew
]
