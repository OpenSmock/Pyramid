Class {
	#name : #PyramidPropertiesController,
	#superclass : #Object,
	#traits : 'TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'editor',
		'selection'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #'as yet unclassified' }
PyramidPropertiesController >> computePropertiesModel [
	self selection
]

{ #category : #accessing }
PyramidPropertiesController >> editor [
	^ editor
]

{ #category : #accessing }
PyramidPropertiesController >> editor: aPyramidEditor [

	editor := aPyramidEditor
]

{ #category : #'as yet unclassified' }
PyramidPropertiesController >> pyramidActiveProjectChangedChanged [

	self updateSelection
]

{ #category : #'as yet unclassified' }
PyramidPropertiesController >> pyramidSelectionChangedOnActiveProject [

	self updateSelection
]

{ #category : #accessing }
PyramidPropertiesController >> selection [

	^ selection 
]

{ #category : #accessing }
PyramidPropertiesController >> selection: aSelection [

	selection := aSelection
]

{ #category : #'as yet unclassified' }
PyramidPropertiesController >> updateSelection [

	self selection: self editor activeProject selection.
	self computePropertiesModel
]
