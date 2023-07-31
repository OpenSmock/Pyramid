Class {
	#name : #PyramidWindow,
	#superclass : #Object,
	#instVars : [
		'presenter',
		'services',
		'title',
		'spec',
		'whenClosedDo'
	],
	#category : #'Pyramid-views'
}

{ #category : #'window - properties' }
PyramidWindow class >> aboutText [

	^ 'Pyramid is a User-Interface (UI) editor.

LICENSE
Licensed under the MIT License
Copyright (c) 2022-2023 OpenSmock

https://github.com/OpenSmock/Pyramid'
]

{ #category : #'window - properties' }
PyramidWindow class >> defaultTitle [

	^ 'New project | Pyramid'
]

{ #category : #accessing }
PyramidWindow >> at: aSymbol addItem: aBlock [

	(self services at: aSymbol) addItem: aBlock
]

{ #category : #'api - showing' }
PyramidWindow >> close [

	self isOpen ifFalse: [ ^ self ].
	self presenter owner close.
	self whenClosedDo value
]

{ #category : #initialization }
PyramidWindow >> initialize [

	title := self class defaultTitle.
	whenClosedDo := [  ].

	PyramidPanelModel toolbarHorizontal installOn: self at: #topLeft.
	PyramidPanelModel toolbarHorizontal installOn: self at: #topCenter.
	PyramidPanelModel toolbarHorizontal installOn: self at: #topRight.
	PyramidPanelModel presenter installOn: self at: #space.
	PyramidPanelModel tab installOn: self at: #tabLeft.
	PyramidPanelModel tab installOn: self at: #tabRight.
	PyramidPanelModel menu installOn: self at: #selectionMenu
]

{ #category : #initialization }
PyramidWindow >> initializePresenter [
	"a Spec presenter using the services as an entry"

	presenter := SpPresenter new layout: self layout; yourself.
	^ presenter
]

{ #category : #'api - showing' }
PyramidWindow >> isClosed [

	^ self presenter owner ifNotNil: [ :w | w isClosed ] ifNil: [ true ]
]

{ #category : #'api - showing' }
PyramidWindow >> isOpen [

	^ self isClosed not
]

{ #category : #accessing }
PyramidWindow >> layout [

	^ self shouldBeImplemented
]

{ #category : #'api - showing' }
PyramidWindow >> open [

	spec := self presenter asWindow open.
	spec maximize.
	spec title: self title.
	spec aboutText: self class aboutText.
	^ spec
]

{ #category : #private }
PyramidWindow >> panelUpdated [

	self presenter layout: self layout
]

{ #category : #accessing }
PyramidWindow >> presenter [
	"a Spec presenter using the services as an entry"

	presenter ifNil: [ presenter := self initializePresenter ].
	^ presenter
]

{ #category : #accessing }
PyramidWindow >> services [
	"Collection of key -> value
	key : aSymbol
	value : aPyramidPanelModel"

	services ifNil: [ services := Dictionary new ].
	^ services
]

{ #category : #'api - showing' }
PyramidWindow >> title [

	^ title
]

{ #category : #'api - showing' }
PyramidWindow >> title: aString [

	title := aString.
	self isOpen ifTrue: [ self presenter owner title: aString ]
]

{ #category : #accessing }
PyramidWindow >> whenClosedDo [

	^ whenClosedDo
]

{ #category : #accessing }
PyramidWindow >> whenClosedDo: aBlock [

	whenClosedDo:= aBlock
]
