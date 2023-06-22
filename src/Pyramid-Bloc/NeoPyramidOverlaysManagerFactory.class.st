Class {
	#name : #NeoPyramidOverlaysManagerFactory,
	#superclass : #Object,
	#instVars : [
		'manager',
		'model'
	],
	#category : #'Pyramid-Bloc-plugin-overlays'
}

{ #category : #'as yet unclassified' }
NeoPyramidOverlaysManagerFactory class >> editManager [

	| factory |
	factory := self new.

	factory at: #keyboardPressed put: Set new.
	factory at: #size put: 600 @ 400.
	factory at: #origin put: 50 @ 50.
	factory at: #editor put: nil.

	factory manager space when: BlKeyDownEvent do: [ :evt |
		(factory model at: #keyboardPressed) object add: evt key.
		(factory model at: #keyboardPressed) triggerCallbacks ].
	factory manager space when: BlKeyUpEvent do: [ :evt |
		(factory model at: #keyboardPressed) object remove: evt key.
		(factory model at: #keyboardPressed) triggerCallbacks ].

	factory addOverlays: {
			NeoPyramidOverlayBuilder mousePositionBlock.
			NeoPyramidOverlayBuilder selectionDisplayBlock.
			NeoPyramidOverlayBuilder movementWheelEventBlock.
			NeoPyramidOverlayBuilder movementMouseEventBlock.
			NeoPyramidOverlayBuilder selectionMakerBlock.
			NeoPyramidOverlayBuilder movementTransformationBlock.
			NeoPyramidOverlayBuilder fakeWindowBlock }.

	^ factory manager
]

{ #category : #tests }
NeoPyramidOverlaysManagerFactory class >> testEditManager [

	<script>
	| manager |
	manager := self editManager.
	manager inspect.
	manager frontLayer overlayElement addChild: (BlElement new
			 background: Color red;
			 yourself).
	manager space show
]

{ #category : #adding }
NeoPyramidOverlaysManagerFactory >> addOverlay: aBlockOrAnOverlay [

	| overlayBuilder |
	aBlockOrAnOverlay isBlock ifFalse: [
		self manager addOverlay: aBlockOrAnOverlay.
		^ self ].

	overlayBuilder := NeoPyramidOverlayBuilder new
		                  model: self model;
		                  yourself.
	aBlockOrAnOverlay value: overlayBuilder.
	self manager addOverlay: overlayBuilder build
]

{ #category : #adding }
NeoPyramidOverlaysManagerFactory >> addOverlays: aCollection [

	aCollection do: [ :each | self addOverlay: each ]
]

{ #category : #accessing }
NeoPyramidOverlaysManagerFactory >> at: aKey put: anObject [

	self model
		at: aKey
		put: (NeoPyramidOverlayGlobalModelValue new object: anObject; yourself)
]

{ #category : #initialization }
NeoPyramidOverlaysManagerFactory >> initialize [

	manager := NeoPyramidOverlaysManager new.
	model := Dictionary new.
	manager model: model
]

{ #category : #adding }
NeoPyramidOverlaysManagerFactory >> manager [

	^ manager
]

{ #category : #adding }
NeoPyramidOverlaysManagerFactory >> model [
	^ model
]
