Class {
	#name : 'PyramidChangePositionWithSiblingsModel',
	#superclass : 'Object',
	#instVars : [
		'zIndex',
		'childIndex'
	],
	#category : 'Pyramid-Bloc-plugin-bloc-siblings',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-siblings'
}

{ #category : 'comparing' }
PyramidChangePositionWithSiblingsModel >> =	anObject [
	
	anObject == self ifTrue: [ ^true ].
	anObject class = self class ifTrue: [ ^ true ].
	^ (self childIndex = anObject childIndex) and: [ self zIndex = anObject zIndex ]
]

{ #category : 'accessing' }
PyramidChangePositionWithSiblingsModel >> childIndex [

	^ childIndex
]

{ #category : 'accessing' }
PyramidChangePositionWithSiblingsModel >> childIndex: anObject [

	childIndex := anObject
]

{ #category : 'accessing' }
PyramidChangePositionWithSiblingsModel >> zIndex [

	^ zIndex
]

{ #category : 'accessing' }
PyramidChangePositionWithSiblingsModel >> zIndex: anObject [

	zIndex := anObject
]
