Trait {
	#name : 'TPyramidEditorExtension',
	#category : 'Pyramid-Bloc-plugin-space-extensions',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-space-extensions'
}

{ #category : 'displaying' }
TPyramidEditorExtension >> currentTransformTranslation [

	| matrix |
	matrix := self elementAtTransforms transformation matrix.
	^ matrix x @ matrix y
]

{ #category : 'as yet unclassified' }
TPyramidEditorExtension >> elementAtDisplays [

	^ (self builder elementAt: #displays)
]

{ #category : 'as yet unclassified' }
TPyramidEditorExtension >> elementAtDisplaysAddons [

	^ self elementAtDisplays childWithId: #displaysAddons
]

{ #category : 'as yet unclassified' }
TPyramidEditorExtension >> elementAtEvents [

	^ self builder elementAt: #events
]

{ #category : 'as yet unclassified' }
TPyramidEditorExtension >> elementAtMain [

	^ self builder elementAt: #main
]

{ #category : 'as yet unclassified' }
TPyramidEditorExtension >> elementAtTransforms [

	^ (self builder elementAt: #transforms)
]

{ #category : 'as yet unclassified' }
TPyramidEditorExtension >> elementAtWidgets [

	^ self builder elementAt: #widgets
]
