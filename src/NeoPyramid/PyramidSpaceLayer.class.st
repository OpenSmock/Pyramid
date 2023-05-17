Class {
	#name : #PyramidSpaceLayer,
	#superclass : #Object,
	#instVars : [
		'root',
		'canvas'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #adding }
PyramidSpaceLayer >> addPanelsOn: aPyramidSimpleWindow [
]

{ #category : #accessing }
PyramidSpaceLayer >> canvas [

	canvas ifNil: [ canvas := BlElement new ].
	^ canvas
]

{ #category : #accessing }
PyramidSpaceLayer >> configureSpaceBuilder: aPyramidSpaceBuilder [

	
]

{ #category : #'as yet unclassified' }
PyramidSpaceLayer >> connectOn: aPyramidEditor [
]

{ #category : #accessing }
PyramidSpaceLayer >> root [

	root ifNil: [ root := BlElement new addChild: self canvas; yourself ].
	^ root
]
