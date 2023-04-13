Class {
	#name : #PyramidEditorBuilder,
	#superclass : #Object,
	#instVars : [
		'editor',
		'plugins',
		'viewBuilder'
	],
	#category : #'NeoPyramid-core'
}

{ #category : #building }
PyramidEditorBuilder >> build [

	| builder |
	builder := self viewBuilder.
	self plugins do: [ :each | each buildViewFrom: self viewBuilder ].

	self editor view: builder build.
	self plugins do: [ :each | each connectOn: self editor ].

	self editor plugins: self plugins.

	^ self editor
]

{ #category : #accessing }
PyramidEditorBuilder >> editor [
	^ editor
]

{ #category : #initialization }
PyramidEditorBuilder >> initialize [

	editor := PyramidEditor new
]

{ #category : #accessing }
PyramidEditorBuilder >> plugins [
	^ plugins
]

{ #category : #accessing }
PyramidEditorBuilder >> plugins: aCollection [

	plugins := aCollection
]

{ #category : #accessing }
PyramidEditorBuilder >> viewBuilder [

	viewBuilder ifNil: [ viewBuilder := PyramidEditorViewBuilder new ].
	^ viewBuilder
]

{ #category : #accessing }
PyramidEditorBuilder >> viewBuilder: aBuilder [

	viewBuilder := aBuilder
]
