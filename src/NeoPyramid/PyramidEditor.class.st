Class {
	#name : #PyramidEditor,
	#superclass : #Object,
	#instVars : [
		'plugins',
		'view',
		'activeProject',
		'commandPipeline'
	],
	#category : #'NeoPyramid-core'
}

{ #category : #accessing }
PyramidEditor >> activeProject [

	^ activeProject
]

{ #category : #accessing }
PyramidEditor >> commandPipeline [

	^ commandPipeline
]

{ #category : #'as yet unclassified' }
PyramidEditor >> initialize [

	activeProject := PyramidActiveProjectModel new.
	view := PyramidEditorVoidView new.
	commandPipeline := PyramidPipeline new.
	plugins := {  }
]

{ #category : #accessing }
PyramidEditor >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidEditor >> plugins: aCollection [

	plugins := aCollection
]

{ #category : #accessing }
PyramidEditor >> view [
 ^ view
]

{ #category : #accessing }
PyramidEditor >> view: aSpPresenter [

	view:= aSpPresenter
]
