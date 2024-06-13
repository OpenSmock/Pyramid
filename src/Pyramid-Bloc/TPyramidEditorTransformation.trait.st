Trait {
	#name : 'TPyramidEditorTransformation',
	#instVars : [
		'transformationObservers'
	],
	#category : 'Pyramid-Bloc-plugin-space-extensions',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-space-extensions'
}

{ #category : 'adding' }
TPyramidEditorTransformation >> addTransformationObserver: anObject [

	self transformationObservers add: anObject
]

{ #category : 'adding' }
TPyramidEditorTransformation >> removeTransformationObserver: anObject [

	self transformationObservers remove: anObject
]

{ #category : 'signalling' }
TPyramidEditorTransformation >> signalTransformationChanged [

	self transformationObservers do: [ :each |
		each informTransformationChanged ]
]

{ #category : 'accessing' }
TPyramidEditorTransformation >> transformationObservers [

	transformationObservers ifNil: [ transformationObservers := Set new ].
	^ transformationObservers
]
