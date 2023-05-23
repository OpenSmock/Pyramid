Class {
	#name : #PyramidProjectModel,
	#superclass : #Object,
	#traits : 'TPyramidProjectModel',
	#classTraits : 'TPyramidProjectModel classTrait',
	#instVars : [
		'extensions',
		'roots',
		'selection'
	],
	#category : #'Pyramid-models'
}

{ #category : #initialization }
PyramidProjectModel >> initialize [

	roots := PyramidRootsModel new
		         project: self;
		         yourself.

	selection := PyramidSelectionModel new
		             project: self;
		             yourself.
	
	extensions := OrderedCollection new.
]

{ #category : #accessing }
PyramidProjectModel >> roots [

	^ roots collection
]

{ #category : #'event handling' }
PyramidProjectModel >> rootsChanged [

	self informRootsChanged
]

{ #category : #accessing }
PyramidProjectModel >> selection [

	^ selection collection
]

{ #category : #'event handling' }
PyramidProjectModel >> selectionChanged [

	self informSelectionChanged
]
