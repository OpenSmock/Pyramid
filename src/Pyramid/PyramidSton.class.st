Class {
	#name : #PyramidSton,
	#superclass : #BlElement,
	#traits : 'TPyramidSton',
	#classTraits : 'TPyramidSton classTrait',
	#category : #'Pyramid-plugin-save'
}

{ #category : #initialization }
PyramidSton >> initialize [

	self buildElements.
	self initializeEvents
]

{ #category : #initialization }
PyramidSton >> initializeEvents [
	"If the element respond to events, it should be connected here"
]
