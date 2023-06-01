Class {
	#name : #PyramidOverlay,
	#superclass : #PyramidOverlayAbstract,
	#instVars : [
		'element'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

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

	self isVisible ifTrue: [ self father connectTo: self son ]
]

{ #category : #testing }
PyramidOverlay >> isVisible [

	^ self father son = self
]

{ #category : #'host space - displaying' }
PyramidOverlay >> show [

	self isVisible ifFalse: [ self father connectTo: self ]
	
]
