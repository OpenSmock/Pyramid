Class {
	#name : 'PyramidSpaceOverlayDecorator',
	#superclass : 'PyramidSpaceContainer',
	#instVars : [
		'wrappee'
	],
	#category : 'Pyramid-Bloc-plugin-space',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-space'
}

{ #category : 'as yet unclassified' }
PyramidSpaceOverlayDecorator >> buildOn: aBlElement [

	super buildOn: aBlElement.
	self wrappee buildOn: self element
]

{ #category : 'accessing' }
PyramidSpaceOverlayDecorator >> wrappee [

	^ wrappee
]

{ #category : 'accessing' }
PyramidSpaceOverlayDecorator >> wrappee: anObject [

	wrappee := anObject
]
