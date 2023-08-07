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
PyramidProjectModel >> allElements [

	^ PyramidElementsManipulationHelper flattenChildrenOfCollection:
		               self roots.
]

{ #category : #accessing }
PyramidProjectModel >> initialize [ 

	selection := PyramidCollectionWithCallbacks new.
	roots := PyramidCollectionWithCallbacks new.
	
	selection subscribe: self withCallback: [ self informSelectionChanged ].
	roots subscribe: self withCallback: [ self informRootsChanged ].
]

{ #category : #removing }
PyramidProjectModel >> removeSelection [

	(self selection asArray difference: self roots asArray) do: [ :each |
		each parent ifNotNil: [ :p | p removeChild: each ] ].
	self roots removeAllFoundIn: self selection asArray.
	self selection removeAll
]

{ #category : #accessing }
PyramidProjectModel >> roots [
^ roots
]

{ #category : #accessing }
PyramidProjectModel >> selection [

	^ selection
]
