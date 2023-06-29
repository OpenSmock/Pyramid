Class {
	#name : #PyramidWindow,
	#superclass : #Object,
	#instVars : [
		'presenter',
		'services'
	],
	#category : #'Pyramid-views'
}

{ #category : #accessing }
PyramidWindow >> at: aSymbol addItem: aBlock [

	(self services at: aSymbol) addItem: aBlock
]

{ #category : #'api - showing' }
PyramidWindow >> close [

	self isOpen ifFalse:[ ^ self ].
	self presenter owner close
]

{ #category : #initialization }
PyramidWindow >> initialize [

	PyramidPanelModel toolbarHorizontal installOn: self at: #topLeft.
	PyramidPanelModel toolbarHorizontal installOn: self at: #topCenter.
	PyramidPanelModel toolbarHorizontal installOn: self at: #topRight.

	PyramidPanelModel presenter installOn: self at: #space.

	PyramidPanelModel tab installOn: self at: #tabLeft.
	PyramidPanelModel tab installOn: self at: #tabRight
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

	| spec |
	spec := self presenter asWindow open.
	spec maximize
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
