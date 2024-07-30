Class {
	#name : #PyramidModalInputStrings,
	#superclass : #PyramidInputStrings,
	#instVars : [
		'windowTitle'
	],
	#category : 'Pyramid-specs-custom'
}

{ #category : #initialization }
PyramidModalInputStrings >> initialize [

super initialize.
windowTitle := ''
]

{ #category : #accessing }
PyramidModalInputStrings >> windowTitle [

	^ windowTitle
]

{ #category : #accessing }
PyramidModalInputStrings >> windowTitle: anObject [

	windowTitle := anObject
]
