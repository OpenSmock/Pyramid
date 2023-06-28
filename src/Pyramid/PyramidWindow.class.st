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

{ #category : #initialization }
PyramidWindow >> initialize [

	PyramidPanelModel toolbarHorizontal installOn: self at: #topLeft.
	PyramidPanelModel toolbarHorizontal installOn: self at: #topCenter.
	PyramidPanelModel toolbarHorizontal installOn: self at: #topRight.

	PyramidPanelModel presenter installOn: self at: #space.
	PyramidPanelModel toolbarVertical
		installOn: self
		at: #spaceToolbarTop.
	PyramidPanelModel toolbarVertical
		installOn: self
		at: #spaceToolbarBottom.

	PyramidPanelModel tab installOn: self at: #tabLeft.
	PyramidPanelModel tab installOn: self at: #tabRight
]

{ #category : #accessing }
PyramidWindow >> layout [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyramidWindow >> panelUpdated [

	self presenter layout: self layout
]

{ #category : #accessing }
PyramidWindow >> presenter [
	"a Spec presenter using the services as an entry"

	presenter ifNil: [ presenter := SpPresenter new layout: self layout; yourself ].
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
