Class {
	#name : #PyramidInputPresenterCallbacks,
	#superclass : #Object,
	#instVars : [
		'presenterClass',
		'setterBlock',
		'getterBlock',
		'connecterBlock'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidInputPresenterCallbacks >> connecterBlock [

	^ connecterBlock
]

{ #category : #accessing }
PyramidInputPresenterCallbacks >> connecterBlock: anObject [

	connecterBlock := anObject
]

{ #category : #accessing }
PyramidInputPresenterCallbacks >> getterBlock [

	^ getterBlock
]

{ #category : #accessing }
PyramidInputPresenterCallbacks >> getterBlock: anObject [

	getterBlock := anObject
]

{ #category : #accessing }
PyramidInputPresenterCallbacks >> presenterClass [

	^ presenterClass
]

{ #category : #accessing }
PyramidInputPresenterCallbacks >> presenterClass: anObject [

	presenterClass := anObject
]

{ #category : #accessing }
PyramidInputPresenterCallbacks >> setterBlock [

	^ setterBlock
]

{ #category : #accessing }
PyramidInputPresenterCallbacks >> setterBlock: anObject [

	setterBlock := anObject
]
