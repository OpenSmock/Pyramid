Class {
	#name : #NeoPyramidProjectModel,
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
NeoPyramidProjectModel >> initialize [ 

	selection := PyramidCollectionWithCallbacks new.
	roots := PyramidCollectionWithCallbacks new.
	
	selection subscribe: self withCallback: [ self informSelectionChanged ].
	roots subscribe: self withCallback: [ self informRootsChanged ].
]

{ #category : #accessing }
NeoPyramidProjectModel >> roots [
^ roots
]

{ #category : #accessing }
NeoPyramidProjectModel >> selection [

	^ selection
]
