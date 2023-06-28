Class {
	#name : #PyramidOverlay,
	#superclass : #Object,
	#instVars : [
		'overlayElement',
		'nextOverlay',
		'name',
		'model'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #adding }
PyramidOverlay >> addNextOverlay: aPyramidOverlay [

	self nextOverlay ifNotNil: [ Error signal: 'Overlay currently in use' ].
	self overlayElement addChild: aPyramidOverlay overlayElement.
	self nextOverlay: aPyramidOverlay
]

{ #category : #initialization }
PyramidOverlay >> initialize [

	overlayElement := BlElement new
		                  zIndex: 100;
		                  yourself.
	name := 'Anonymous overlay controller'
]

{ #category : #accessing }
PyramidOverlay >> model [

	^ model
]

{ #category : #accessing }
PyramidOverlay >> model: anObject [

	model := anObject
]

{ #category : #accessing }
PyramidOverlay >> name [

	^ name
]

{ #category : #accessing }
PyramidOverlay >> name: anObject [

	name := anObject
]

{ #category : #accessing }
PyramidOverlay >> nextOverlay [

	^ nextOverlay
]

{ #category : #accessing }
PyramidOverlay >> nextOverlay: anObject [

	nextOverlay := anObject
]

{ #category : #accessing }
PyramidOverlay >> overlayElement [

	^ overlayElement
]

{ #category : #accessing }
PyramidOverlay >> overlayElement: anObject [

	overlayElement := anObject
]

{ #category : #adding }
PyramidOverlay >> removeNextOverlay [

	self nextOverlay ifNil: [ Error signal: 'Overlay currently not in use' ].
	self overlayElement removeChild: self nextOverlay overlayElement.
	self nextOverlay: nil
]
