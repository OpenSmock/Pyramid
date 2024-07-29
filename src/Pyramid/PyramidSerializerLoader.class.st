Class {
	#name : #PyramidSerializerLoader,
	#superclass : #Object,
	#category : #'Pyramid-external-ressources'
}

{ #category : #'as yet unclassified' }
PyramidSerializerLoader class >> loadClass: aClass selector: aSelector [

	^ (aClass perform: aSelector) materializeAsBlElement
]
