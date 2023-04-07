Class {
	#name : #PyramidActiveProjectModel,
	#superclass : #Object,
	#traits : 'TPyramidActiveProjectModel + TPyramidProjectModelObserver',
	#classTraits : 'TPyramidActiveProjectModel classTrait + TPyramidProjectModelObserver classTrait',
	#instVars : [
		'project'
	],
	#category : #'NeoPyramid-models'
}

{ #category : #initialization }
PyramidActiveProjectModel >> initialize [

	project := PyramidProjectModelVoid new.
]

{ #category : #accessing }
PyramidActiveProjectModel >> project [
	^ project
]

{ #category : #accessing }
PyramidActiveProjectModel >> project: aPyramidProjectModel [

	self project removeObserver: self.
	project := aPyramidProjectModel.
	project addObserver: self.
	self informActiveProjectChanged
]

{ #category : #'as yet unclassified' }
PyramidActiveProjectModel >> pyramidRootsChanged [

	self informRootsChangedOnActiveProject
]

{ #category : #'as yet unclassified' }
PyramidActiveProjectModel >> pyramidSelectionChanged [

	self informSelectionChangedOnActiveProject
]
