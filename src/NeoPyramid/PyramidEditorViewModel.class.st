Class {
	#name : #PyramidEditorViewModel,
	#superclass : #Object,
	#instVars : [
		'adders',
		'others',
		'rootsViewers',
		'tools',
		'leftTabs',
		'rightTabs',
		'centralView',
		'centralViews'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #accessing }
PyramidEditorViewModel >> centralViews [

	^ centralViews
]

{ #category : #initialization }
PyramidEditorViewModel >> initialize [

	leftTabs := OrderedCollection new.
	rightTabs := OrderedCollection new.
	centralViews := OrderedCollection new.
	tools := OrderedCollection new
]

{ #category : #accessing }
PyramidEditorViewModel >> leftTabs [

	^ leftTabs
]

{ #category : #accessing }
PyramidEditorViewModel >> rightTabs [

	^ rightTabs
]

{ #category : #accessing }
PyramidEditorViewModel >> tools [

	^ tools
]
