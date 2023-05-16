Class {
	#name : #PyramidSpaceLayer,
	#superclass : #Object,
	#instVars : [
		'root',
		'canvas'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #accessing }
PyramidSpaceLayer >> builder: aPyramidSpaceBuilder [
]

{ #category : #accessing }
PyramidSpaceLayer >> canvas [

	canvas ifNil: [ canvas := BlElement new ].
	^ canvas
]

{ #category : #accessing }
PyramidSpaceLayer >> root [

	root ifNil: [ root := BlElement new addChild: self canvas; yourself ].
	^ root
]
