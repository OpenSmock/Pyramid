Class {
	#name : #NeoPyramidCluster,
	#superclass : #Object,
	#category : #NeoPyramid
}

{ #category : #'as yet unclassified' }
NeoPyramidCluster >> allTargets [

	"Collection of all targets of the cluster"
]

{ #category : #accessing }
NeoPyramidCluster >> arguments [
"Collection of all arguments of the cluster"
	
]

{ #category : #accessing }
NeoPyramidCluster >> groupedAssociations [
	"Collection of association with:
	- key: anArgument
	- value: { aTarget . aTarget }"
	
]

{ #category : #accessing }
NeoPyramidCluster >> individualAssociations [
	"Collection of association with:
	- key: anArgument
	- value: { aTarget } (only one item in collection)"

	
]

{ #category : #testing }
NeoPyramidCluster >> isEmpty [

	^ self arguments isEmpty
]

{ #category : #testing }
NeoPyramidCluster >> isTargetsSameArguments [
	"true if all targets have the same argument."
	^ self arguments size = 1
]

{ #category : #'as yet unclassified' }
NeoPyramidCluster >> register: aTarget forArguments: anArguments [

]
