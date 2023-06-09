Class {
	#name : #PyramidActiveProjectModel,
	#superclass : #Object,
	#traits : 'TPyramidActiveProjectModel + TPyramidProjectModelObserver',
	#classTraits : 'TPyramidActiveProjectModel classTrait + TPyramidProjectModelObserver classTrait',
	#instVars : [
		'project'
	],
	#category : #'Pyramid-models'
}

{ #category : #'as yet unclassified' }
PyramidActiveProjectModel >> informActiveProjectChanged [

	self observers do: [ :each | each pyramidActiveProjectChanged ]
]

{ #category : #initialization }
PyramidActiveProjectModel >> initialize [
	project := PyramidProjectModel new.
	project addObserver: self
	
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

{ #category : #accessing }
PyramidActiveProjectModel >> roots [

	^ self project roots
]

{ #category : #accessing }
PyramidActiveProjectModel >> selection [

	^ self project selection
]