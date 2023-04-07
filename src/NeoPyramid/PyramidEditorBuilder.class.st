Class {
	#name : #PyramidEditorBuilder,
	#superclass : #Object,
	#instVars : [
		'editor',
		'plugins'
	],
	#category : #'NeoPyramid-core'
}

{ #category : #building }
PyramidEditorBuilder >> build [

	self buildGlobalView.
	self buildConnectors.
	self editor plugins: self plugins.
	^ self editor
]

{ #category : #building }
PyramidEditorBuilder >> buildConnectors [

	self plugins do: [ :each | each connectOn: self editor ].

]

{ #category : #building }
PyramidEditorBuilder >> buildGlobalView [

	| builder   |
	builder := PyramidGlobalViewBuilder new.
	self plugins do: [ :each | each buildGlobalViewOn: builder ].
	self editor view:  builder build.
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
