Class {
	#name : #PyramidOverlay,
	#superclass : #Object,
	#traits : 'TPyramidOverlay',
	#classTraits : 'TPyramidOverlay classTrait',
	#instVars : [
		'element',
		'position',
		'visible'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #comparing }
PyramidOverlay >> <= anOverlay [

^ self position <= anOverlay position
]

{ #category : #accessing }
PyramidOverlay >> element [

	element ifNil: [ element := BlElement new ].
	^ element
]

{ #category : #accessing }
PyramidOverlay >> element: anObject [

	element := anObject
]

{ #category : #'host space - displaying' }
PyramidOverlay >> hide [

	self isVisible ifFalse: [ ^ self ].
	visible := false.
	self informVisibilityChanged
]

{ #category : #initialization }
PyramidOverlay >> initialize [ 

	visible := true
]

{ #category : #testing }
PyramidOverlay >> isVisible [

	^ visible
]

{ #category : #'public - line' }
PyramidOverlay >> position [

	position ifNil: [ position := 0 ].
	^ position
]

{ #category : #'public - line' }
PyramidOverlay >> position: aNumber [
	position := aNumber
]

{ #category : #'host space - displaying' }
PyramidOverlay >> show [

		self isVisible ifTrue: [ ^ self ].
	visible := true.
	self informVisibilityChanged
]
