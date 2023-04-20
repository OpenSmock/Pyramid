Class {
	#name : #PyramidPropertyInputModel,
	#superclass : #Object,
	#instVars : [
		'globalInput',
		'elementInputModel'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputModel >> addElementInput: anObject [

	elementInputModel add: anObject
]

{ #category : #accessing }
PyramidPropertyInputModel >> elementInputModel [

	^ elementInputModel
]

{ #category : #accessing }
PyramidPropertyInputModel >> globalInput [

	^ globalInput
]

{ #category : #accessing }
PyramidPropertyInputModel >> globalInput: anObject [

	globalInput := anObject
]

{ #category : #initialization }
PyramidPropertyInputModel >> initialize [

	elementInputModel := OrderedCollection new.
]

{ #category : #accessing }
PyramidPropertyInputModel >> removeElementInput: anObject [

	elementInputModel remove: anObject
]
