Class {
	#name : #PyramidSpaceMode,
	#superclass : #Object,
	#instVars : [
		'builder'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #adding }
PyramidSpaceMode >> addExtension: aBlock [

	self builder addExtension:aBlock
]

{ #category : #accessing }
PyramidSpaceMode >> builder [

	^ builder
]

{ #category : #initialization }
PyramidSpaceMode >> initialize [

	builder := PyramidSpaceBuilder new.
	builder addAllOverlaysNamed: self overlayNames
]

{ #category : #'as yet unclassified' }
PyramidSpaceMode >> overlayNames [

	^ { #widgets . #events . #displays . #transforms }
]
