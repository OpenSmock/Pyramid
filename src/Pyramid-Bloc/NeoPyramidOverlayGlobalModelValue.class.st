Class {
	#name : #NeoPyramidOverlayGlobalModelValue,
	#superclass : #Object,
	#instVars : [
		'callbacks',
		'object'
	],
	#category : #'Pyramid-Bloc-plugin-overlays'
}

{ #category : #accessing }
NeoPyramidOverlayGlobalModelValue >> callbacks [

	^ callbacks
]

{ #category : #initialization }
NeoPyramidOverlayGlobalModelValue >> initialize [

	callbacks := Dictionary new.
]

{ #category : #accessing }
NeoPyramidOverlayGlobalModelValue >> object [

	^ object
]

{ #category : #accessing }
NeoPyramidOverlayGlobalModelValue >> object: anObject [

	object := anObject.
	self triggerCallbacks
]

{ #category : #'as yet unclassified' }
NeoPyramidOverlayGlobalModelValue >> subcribe: anObject with: aBlock [

	self callbacks at: anObject put: aBlock
]

{ #category : #accessing }
NeoPyramidOverlayGlobalModelValue >> triggerCallbacks [
	self callbacks valuesDo: [ :block | block value: self object ]
]

{ #category : #'as yet unclassified' }
NeoPyramidOverlayGlobalModelValue >> unsubcribe: anObject [

	self callbacks remove: anObject
]
