Class {
	#name : #PyramidEditorBuilder,
	#superclass : #Object,
	#instVars : [
		'plugins'
	],
	#category : #'NeoPyramid-core'
}

{ #category : #building }
PyramidEditorBuilder >> build [

	| editor simpleWindow |
	editor := PyramidEditor new.
	simpleWindow := PyramidSimpleWindow new.

	editor window: simpleWindow.
	editor plugins: self plugins.

	self plugins do: [ :each | each addPanelsOn: simpleWindow ].
	self plugins do: [ :each | each connectOn: editor ].
	^ editor
]

{ #category : #accessing }
PyramidEditorBuilder >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidEditorBuilder >> plugins: anObject [

	plugins := anObject
]
