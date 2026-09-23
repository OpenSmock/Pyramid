Trait {
	#name : #TPyramidEditorExtension,
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #displaying }
TPyramidEditorExtension >> currentTransformTranslation [

	| matrix |
	matrix := self elementAtTransforms transformation matrix.
	^ matrix x @ matrix y
]

{ #category : #displaying }
TPyramidEditorExtension >> elementAtDisplays [

	^ (self builder elementAt: #displays)
]

{ #category : #displaying }
TPyramidEditorExtension >> elementAtDisplaysAddons [

	^ self elementAtDisplays childWithId: #displaysAddons
]

{ #category : #displaying }
TPyramidEditorExtension >> elementAtEvents [

	^ self builder elementAt: #events
]

{ #category : #displaying }
TPyramidEditorExtension >> elementAtMain [

	^ self builder elementAt: #main
]

{ #category : #displaying }
TPyramidEditorExtension >> elementAtTransforms [

	^ (self builder elementAt: #transforms)
]

{ #category : #displaying }
TPyramidEditorExtension >> elementAtWidgets [

	^ self builder elementAt: #widgets
]
