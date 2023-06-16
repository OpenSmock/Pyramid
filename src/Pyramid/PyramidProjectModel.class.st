Class {
	#name : #PyramidProjectModel,
	#superclass : #Object,
	#traits : 'TPyramidProjectModel',
	#classTraits : 'TPyramidProjectModel classTrait',
	#instVars : [
		'roots',
		'selection'
	],
	#category : #'Pyramid-models'
}

{ #category : #accessing }
PyramidProjectModel >> initialize [ 

	selection := PyramidCollectionWithCallbacks new.
	roots := PyramidCollectionWithCallbacks new.
	
	selection subscribe: self withCallback: [ self informSelectionChanged ].
	roots subscribe: self withCallback: [ self informRootsChanged ].
]

{ #category : #accessing }
PyramidProjectModel >> roots [
^ roots
]

{ #category : #accessing }
PyramidProjectModel >> selection [

	^ selection
]
