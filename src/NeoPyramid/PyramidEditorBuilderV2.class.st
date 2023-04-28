Class {
	#name : #PyramidEditorBuilderV2,
	#superclass : #Object,
	#instVars : [
		'plugins'
	],
	#category : #'NeoPyramid-core'
}

{ #category : #building }
PyramidEditorBuilderV2 >> build [

	| editor simpleWindow |
	editor := PyramidEditor new.
	simpleWindow := PyramidSimpleWindow new.
	self plugins do: [ :each | each addPanelsOn: simpleWindow ].

	editor view: simpleWindow presenter.
	editor plugins: self plugins.
	
	self plugins do: [ :each | each connectOn: editor ].
	^ editor
]

{ #category : #accessing }
PyramidEditorBuilderV2 >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidEditorBuilderV2 >> plugins: anObject [

	plugins := anObject
]
