Class {
	#name : #PyramidEditorModel,
	#superclass : #Object,
	#instVars : [
		'adders',
		'browsers',
		'others',
		'propertiesViewers',
		'rootsViewers',
		'tools'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #accessing }
PyramidEditorModel >> adders [

	^ adders
]

{ #category : #accessing }
PyramidEditorModel >> browsers [

	^ browsers
]

{ #category : #initialization }
PyramidEditorModel >> initialize [

	adders := OrderedCollection new.
	browsers:= OrderedCollection new.
	others:= OrderedCollection new.
	propertiesViewers:= OrderedCollection new.
	rootsViewers:= OrderedCollection new.
	tools:= OrderedCollection new.
]

{ #category : #accessing }
PyramidEditorModel >> others [

	^ others
]

{ #category : #accessing }
PyramidEditorModel >> propertiesViewers [

	^ propertiesViewers
]

{ #category : #accessing }
PyramidEditorModel >> rootsViewers [

	^ rootsViewers
]

{ #category : #accessing }
PyramidEditorModel >> tools [

	^ tools
]
