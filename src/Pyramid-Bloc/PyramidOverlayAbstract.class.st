Class {
	#name : #PyramidOverlayAbstract,
	#superclass : #Object,
	#instVars : [
		'father',
		'son',
		'position'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #testing }
PyramidOverlayAbstract class >> isAbstract [ 

	^ self = PyramidOverlayAbstract 
]

{ #category : #'public - line' }
PyramidOverlayAbstract >> connectTo: anotherOverlay [

	(self son isRoot not and: [
		 self son position < anotherOverlay position ]) ifTrue: [
		self son connectTo: anotherOverlay ].

	self element removeChild: self son element.
	self element addChild: anotherOverlay element.
	anotherOverlay element addChild: self son element.

	self son father: anotherOverlay.
	anotherOverlay son: self son.
	self son: anotherOverlay.
	anotherOverlay father: self
]

{ #category : #accessing }
PyramidOverlayAbstract >> element [

	^ self shouldBeImplemented 
]

{ #category : #accessing }
PyramidOverlayAbstract >> father [

	^ father
]

{ #category : #accessing }
PyramidOverlayAbstract >> father: anObject [

	father := anObject
]

{ #category : #testing }
PyramidOverlayAbstract >> isRoot [

	^ false
]

{ #category : #'public - line' }
PyramidOverlayAbstract >> position [

	position ifNil: [ position := 0 ].
	^ position
]

{ #category : #'public - line' }
PyramidOverlayAbstract >> position: aNumber [
	position := aNumber
]

{ #category : #accessing }
PyramidOverlayAbstract >> son [

	^ son
]

{ #category : #accessing }
PyramidOverlayAbstract >> son: anObject [

	son := anObject
]
