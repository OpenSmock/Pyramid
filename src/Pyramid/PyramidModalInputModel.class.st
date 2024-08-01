Class {
	#name : #PyramidModalInputModel,
	#superclass : #PyramidInputModel,
	#instVars : [
		'windowTitle'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #initialization }
PyramidModalInputModel >> initialize [

super initialize.
windowTitle := ''
]

{ #category : #accessing }
PyramidModalInputModel >> windowTitle [

	^ windowTitle
]

{ #category : #accessing }
PyramidModalInputModel >> windowTitle: anObject [

	windowTitle := anObject
]
