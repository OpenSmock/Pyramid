Class {
	#name : #NeoPyramidOverlaysManager,
	#superclass : #Object,
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'overlays',
		'frontLayer',
		'model',
		'space',
		'spaceLayer'
	],
	#category : #'Pyramid-Bloc-plugin-overlays'
}

{ #category : #adding }
NeoPyramidOverlaysManager >> addOverlay: anOverlay [

	self uninstallOverlays.
	self overlays add: anOverlay.
	self installOverlays
]

{ #category : #adding }
NeoPyramidOverlaysManager >> addOverlays: aCollection [

	self uninstallOverlays.
	self overlays addAll: aCollection.
	self installOverlays
]

{ #category : #accessing }
NeoPyramidOverlaysManager >> frontLayer [

	^ frontLayer
]

{ #category : #accessing }
NeoPyramidOverlaysManager >> frontLayer: anObject [

	self uninstallOverlays.
	frontLayer := anObject.
	self installOverlays.
]

{ #category : #initialization }
NeoPyramidOverlaysManager >> initialize [

	space := BlSpace new.

	overlays := OrderedCollection new.
	spaceLayer := NeoPyramidOverlay new.
	spaceLayer overlayElement: space root.
	space root constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	frontLayer := NeoPyramidOverlay new.
	frontLayer overlayElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ]; clipChildren: false
]

{ #category : #adding }
NeoPyramidOverlaysManager >> installOverlays [

	self overlays overlappingPairsDo: [ :each :next |
		each addNextOverlay: next ].
	self overlays last addNextOverlay: self frontLayer.
	self spaceLayer addNextOverlay: self overlays first
]

{ #category : #accessing }
NeoPyramidOverlaysManager >> model [

	^ model
]

{ #category : #accessing }
NeoPyramidOverlaysManager >> model: anObject [

	model := anObject
]

{ #category : #accessing }
NeoPyramidOverlaysManager >> overlays [

	^ overlays
]

{ #category : #accessing }
NeoPyramidOverlaysManager >> overlays: anObject [

	overlays := anObject
]

{ #category : #accessing }
NeoPyramidOverlaysManager >> space [

	^ space
]

{ #category : #accessing }
NeoPyramidOverlaysManager >> spaceLayer [

	^ spaceLayer
]

{ #category : #accessing }
NeoPyramidOverlaysManager >> spaceLayer: anObject [

	self uninstallOverlays.
	spaceLayer := anObject.
	self installOverlays
]

{ #category : #adding }
NeoPyramidOverlaysManager >> uninstallOverlays [

	self overlays ifEmpty: [ ^ self ].
	self spaceLayer removeNextOverlay.
	self overlays do: [ :each | each removeNextOverlay ]
]
