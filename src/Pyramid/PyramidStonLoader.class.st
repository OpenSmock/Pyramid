Class {
	#name : 'PyramidStonLoader',
	#superclass : 'Object',
	#category : 'Pyramid-external-ressources',
	#package : 'Pyramid',
	#tag : 'external-ressources'
}

{ #category : 'as yet unclassified' }
PyramidStonLoader class >> loadClass: aClass selector: aSelector [

	^ (aClass perform: aSelector) materializeAsBlElement
]
