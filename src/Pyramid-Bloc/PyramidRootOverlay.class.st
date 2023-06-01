Class {
	#name : #PyramidRootOverlay,
	#superclass : #PyramidOverlayAbstract,
	#instVars : [
		'element'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #initialization }
PyramidRootOverlay >> element [

	element ifNil: [ element := BlElement new
		           id: #pyramid_root;
		           constraintsDo: [ :c |
			           c horizontal matchParent.
			           c vertical matchParent ];
		           yourself].
	^ element
]

{ #category : #initialization }
PyramidRootOverlay >> initialize [

	element := BlElement new
	id: #pyramid_root;
		           constraintsDo: [ :c |
			           c horizontal matchParent.
			           c vertical matchParent ];
		           yourself
]

{ #category : #testing }
PyramidRootOverlay >> isRoot [

	^ true
]

{ #category : #accessing }
PyramidRootOverlay >> son [ 

	self shouldNotImplement 
]

{ #category : #accessing }
PyramidRootOverlay >> son: anObject [

	self shouldNotImplement
]
