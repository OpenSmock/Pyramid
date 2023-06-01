Class {
	#name : #PyramidSpaceOverlay,
	#superclass : #PyramidOverlayAbstract,
	#instVars : [
		'space'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #initialization }
PyramidSpaceOverlay >> element [ 
	
space root
]

{ #category : #accessing }
PyramidSpaceOverlay >> father [

	self shouldNotImplement
]

{ #category : #accessing }
PyramidSpaceOverlay >> father: anObject [

	self shouldNotImplement
]

{ #category : #initialization }
PyramidSpaceOverlay >> initialize [

	space := BlSpace new.
	space root id: #pyramid_space
]

{ #category : #accessing }
PyramidSpaceOverlay >> space [

	^ space
]
