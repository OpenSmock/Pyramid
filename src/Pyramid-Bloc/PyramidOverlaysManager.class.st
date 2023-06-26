Class {
	#name : #PyramidOverlaysManager,
	#superclass : #Object,
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'overlays',
		'frontLayer',
		'model',
		'space',
		'spaceLayer'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #adding }
PyramidOverlaysManager >> addOverlay: anOverlay [

	self uninstallOverlays.
	self overlays add: anOverlay.
	self installOverlays
]

{ #category : #adding }
PyramidOverlaysManager >> addOverlays: aCollection [

	self uninstallOverlays.
	self overlays addAll: aCollection.
	self installOverlays
]

{ #category : #accessing }
PyramidOverlaysManager >> frontLayer [

	^ frontLayer
]

{ #category : #accessing }
PyramidOverlaysManager >> frontLayer: anObject [

	self uninstallOverlays.
	frontLayer := anObject.
	self installOverlays.
]

{ #category : #initialization }
PyramidOverlaysManager >> initialize [

	self initializeSpace.

	overlays := OrderedCollection new.

	frontLayer := PyramidOverlay new.
	frontLayer overlayElement
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		clipChildren: false
]

{ #category : #initialization }
PyramidOverlaysManager >> initializeSpace [

	space := BlSpace new.
	spaceLayer := PyramidOverlay new.
	spaceLayer overlayElement: space root.
	space root constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
]

{ #category : #adding }
PyramidOverlaysManager >> installOverlays [

	self overlays overlappingPairsDo: [ :each :next |
		each addNextOverlay: next ].
	self overlays last addNextOverlay: self frontLayer.
	self spaceLayer addNextOverlay: self overlays first
]

{ #category : #accessing }
PyramidOverlaysManager >> model [

	^ model
]

{ #category : #accessing }
PyramidOverlaysManager >> model: anObject [

	model := anObject
]

{ #category : #accessing }
PyramidOverlaysManager >> overlays [

	^ overlays
]

{ #category : #accessing }
PyramidOverlaysManager >> overlays: anObject [

	overlays := anObject
]

{ #category : #initialization }
PyramidOverlaysManager >> resetSpace [

	self space hide.
	self uninstallOverlays.
	self initializeSpace.
	self installOverlays.
	self space show
]

{ #category : #accessing }
PyramidOverlaysManager >> space [

	^ space
]

{ #category : #accessing }
PyramidOverlaysManager >> spaceLayer [

	^ spaceLayer
]

{ #category : #accessing }
PyramidOverlaysManager >> spaceLayer: anObject [

	self uninstallOverlays.
	spaceLayer := anObject.
	self installOverlays
]

{ #category : #adding }
PyramidOverlaysManager >> uninstallOverlays [

	self overlays ifEmpty: [ ^ self ].
	self spaceLayer removeNextOverlay.
	self overlays do: [ :each | each removeNextOverlay ]
]
