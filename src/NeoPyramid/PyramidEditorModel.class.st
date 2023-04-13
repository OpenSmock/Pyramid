Class {
	#name : #PyramidEditorModel,
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
PyramidEditorModel >> centralViews [

	^ centralViews
]

{ #category : #initialization }
PyramidEditorModel >> initialize [

	leftTabs := OrderedCollection new.
	rightTabs := OrderedCollection new.
	centralViews := OrderedCollection new.
	tools := OrderedCollection new
]

{ #category : #accessing }
PyramidEditorModel >> leftTabs [

	^ leftTabs
]

{ #category : #accessing }
PyramidEditorModel >> rightTabs [

	^ rightTabs
]

{ #category : #accessing }
PyramidEditorModel >> tools [

	^ tools
]
