Class {
	#name : #PyTopPanelHelper,
	#superclass : #Object,
	#category : #'Pyramid-Editor-Panels-Top'
}

{ #category : #'as yet unclassified' }
PyTopPanelHelper class >> addButton: aButton toLayout: aLayout [

	aLayout add: aButton withConstraints: [ :c |
		c height: 40.
		c width: 40 ]
]

{ #category : #'as yet unclassified' }
PyTopPanelHelper >> seeClassSide [

]
