Trait {
	#name : #TPyramidEditorTransformation,
	#instVars : [
		'transformationObservers'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #adding }
TPyramidEditorTransformation >> addTransformationObserver: anObject [

	self transformationObservers add: anObject
]

{ #category : #adding }
TPyramidEditorTransformation >> removeTransformationObserver: anObject [

	self transformationObservers remove: anObject
]

{ #category : #accessing }
TPyramidEditorTransformation >> transformationObservers [

	transformationObservers ifNil: [ transformationObservers := Set new ].
	^ transformationObservers
]
