Class {
	#name : #PyramidPanelModel,
	#superclass : #Object,
	#instVars : [
		'builder',
		'items'
	],
	#category : #'NeoPyramid-aaa-views'
}

{ #category : #adding }
PyramidPanelModel >> addItem: aBlock [

	self builder reset.
	aBlock value: self builder.
	self items add: self builder item
]

{ #category : #accessing }
PyramidPanelModel >> builder [

	^ builder
]

{ #category : #accessing }
PyramidPanelModel >> builder: anObject [

	builder := anObject
]

{ #category : #adding }
PyramidPanelModel >> initialize [

	items := OrderedCollection new.
]

{ #category : #accessing }
PyramidPanelModel >> items [

	^ items
]

{ #category : #accessing }
PyramidPanelModel >> presenter [

	^ self builder presenterOf: self items
]
