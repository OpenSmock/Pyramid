Trait {
	#name : #TPyramidEditorSpaceIsReady,
	#instVars : [
		'spaceIsReadyObservers'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #adding }
TPyramidEditorSpaceIsReady >> addSpaceIsReadyObserver: anObject [

	self spaceIsReadyObservers add: anObject
]

{ #category : #adding }
TPyramidEditorSpaceIsReady >> removeSpaceIsReadyObserver: anObject [

	self spaceIsReadyObservers remove: anObject
]

{ #category : #signalling }
TPyramidEditorSpaceIsReady >> signalSpaceIsReady [

	self spaceIsReadyObservers do: [ :each | each informSpaceIsReady ]
]

{ #category : #accessing }
TPyramidEditorSpaceIsReady >> spaceIsReadyObservers [

	spaceIsReadyObservers ifNil: [ spaceIsReadyObservers := Set new ].
	^ spaceIsReadyObservers
]
