Class {
	#name : #PyramidOverlayGlobalModelValue,
	#superclass : #Object,
	#instVars : [
		'callbacks',
		'object'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #accessing }
PyramidOverlayGlobalModelValue >> callbacks [

	^ callbacks
]

{ #category : #initialization }
PyramidOverlayGlobalModelValue >> initialize [

	callbacks := Dictionary new.
]

{ #category : #accessing }
PyramidOverlayGlobalModelValue >> object [

	^ object
]

{ #category : #accessing }
PyramidOverlayGlobalModelValue >> object: anObject [

	object := anObject.
	self triggerCallbacks
]

{ #category : #'as yet unclassified' }
PyramidOverlayGlobalModelValue >> subcribe: anObject with: aBlock [

	self callbacks at: anObject put: aBlock
]

{ #category : #accessing }
PyramidOverlayGlobalModelValue >> triggerCallbacks [
	self callbacks valuesDo: [ :block | block value: self object ]
]

{ #category : #'as yet unclassified' }
PyramidOverlayGlobalModelValue >> unsubcribe: anObject [

	self callbacks remove: anObject
]
