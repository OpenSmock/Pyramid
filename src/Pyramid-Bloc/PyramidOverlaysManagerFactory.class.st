Class {
	#name : #PyramidOverlaysManagerFactory,
	#superclass : #Object,
	#instVars : [
		'manager',
		'model'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #'as yet unclassified' }
PyramidOverlaysManagerFactory class >> editManager [

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
			PyramidOverlayBuilder mousePositionBlock.
			PyramidOverlayBuilder selectionDisplayBlock.
			PyramidOverlayBuilder movementWheelEventBlock.
			PyramidOverlayBuilder movementMouseEventBlock.
			PyramidOverlayBuilder selectionMakerBlock.
			PyramidOverlayBuilder movementTransformationBlock.
			PyramidOverlayBuilder fakeWindowBlock }.

	^ factory manager
]

{ #category : #tests }
PyramidOverlaysManagerFactory class >> testEditManager [

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
PyramidOverlaysManagerFactory >> addOverlay: aBlockOrAnOverlay [

	| overlayBuilder |
	aBlockOrAnOverlay isBlock ifFalse: [
		self manager addOverlay: aBlockOrAnOverlay.
		^ self ].

	overlayBuilder := PyramidOverlayBuilder new
		                  model: self model;
		                  yourself.
	aBlockOrAnOverlay value: overlayBuilder.
	self manager addOverlay: overlayBuilder build
]

{ #category : #adding }
PyramidOverlaysManagerFactory >> addOverlays: aCollection [

	aCollection do: [ :each | self addOverlay: each ]
]

{ #category : #accessing }
PyramidOverlaysManagerFactory >> at: aKey put: anObject [

	self model
		at: aKey
		put: (PyramidOverlayGlobalModelValue new object: anObject; yourself)
]

{ #category : #initialization }
PyramidOverlaysManagerFactory >> initialize [

	manager := PyramidOverlaysManager new.
	model := Dictionary new.
	manager model: model
]

{ #category : #adding }
PyramidOverlaysManagerFactory >> manager [

	^ manager
]

{ #category : #adding }
PyramidOverlaysManagerFactory >> model [
	^ model
]
