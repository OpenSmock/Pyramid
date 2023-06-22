Class {
	#name : #NeoPyramidOverlay,
	#superclass : #Object,
	#instVars : [
		'overlayElement',
		'nextOverlay',
		'name',
		'model'
	],
	#category : #'Pyramid-Bloc-plugin-overlays'
}

{ #category : #adding }
NeoPyramidOverlay >> addNextOverlay: aPyramidOverlay [

	self nextOverlay ifNotNil: [ Error signal: 'Overlay currently in use' ].
	self overlayElement addChild: aPyramidOverlay overlayElement.
	self nextOverlay: aPyramidOverlay
]

{ #category : #initialization }
NeoPyramidOverlay >> initialize [

	overlayElement := BlElement new
		                  zIndex: 100;
		                  yourself.
	name := 'Anonymous overlay controller'
]

{ #category : #accessing }
NeoPyramidOverlay >> model [

	^ model
]

{ #category : #accessing }
NeoPyramidOverlay >> model: anObject [

	model := anObject
]

{ #category : #accessing }
NeoPyramidOverlay >> name [

	^ name
]

{ #category : #accessing }
NeoPyramidOverlay >> name: anObject [

	name := anObject
]

{ #category : #accessing }
NeoPyramidOverlay >> nextOverlay [

	^ nextOverlay
]

{ #category : #accessing }
NeoPyramidOverlay >> nextOverlay: anObject [

	nextOverlay := anObject
]

{ #category : #accessing }
NeoPyramidOverlay >> overlayElement [

	^ overlayElement
]

{ #category : #accessing }
NeoPyramidOverlay >> overlayElement: anObject [

	overlayElement := anObject
]

{ #category : #adding }
NeoPyramidOverlay >> removeNextOverlay [

	self nextOverlay ifNil: [ Error signal: 'Overlay currently not in use' ].
	self overlayElement removeChild: self nextOverlay overlayElement.
	self nextOverlay: nil
]
