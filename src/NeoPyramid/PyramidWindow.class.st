Class {
	#name : #PyramidWindow,
	#superclass : #Object,
	#instVars : [
		'presenter',
		'services'
	],
	#category : #'NeoPyramid-aaa-views'
}

{ #category : #accessing }
PyramidWindow >> at: aSymbol addItem: aBlock [

	(self services at: aSymbol) addItem: aBlock
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
