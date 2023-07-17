Class {
	#name : #NeoPyramidCluster,
	#superclass : #Object,
	#instVars : [
		'allTargets',
		'arguments',
		'groupedAssociations',
		'individualAssociations'
	],
	#category : #NeoPyramid
}

{ #category : #'as yet unclassified' }
NeoPyramidCluster >> allTargets [
	"Collection of all targets of the cluster"

	^ allTargets
]

{ #category : #accessing }
NeoPyramidCluster >> arguments [
	"Collection of all arguments of the cluster"

	^ arguments
]

{ #category : #accessing }
NeoPyramidCluster >> groupedAssociations [
	"Collection of association with:
	- key: anArgument
	- value: { aTarget . aTarget }"

	^ groupedAssociations
]

{ #category : #accessing }
NeoPyramidCluster >> individualAssociations [
	"Collection of association with:
	- key: anArgument
	- value: { aTarget } (only one item in collection)"

	^ individualAssociations
]

{ #category : #initialization }
NeoPyramidCluster >> initialize [

	allTargets := OrderedCollection new.
	arguments := OrderedCollection new.
	groupedAssociations := Dictionary new.
	individualAssociations := OrderedCollection new
]

{ #category : #testing }
NeoPyramidCluster >> isEmpty [

	^ self arguments isEmpty
]

{ #category : #testing }
NeoPyramidCluster >> isNotEmpty [

	^ self isEmpty not
]

{ #category : #testing }
NeoPyramidCluster >> isTargetsSameArguments [
	"true if all targets have the same argument."
	^ self arguments size = 1
]

{ #category : #'as yet unclassified' }
NeoPyramidCluster >> register: aTarget forArguments: anArguments [

	(self allTargets includes: aTarget) ifTrue: [^ self].
	self allTargets add: aTarget.
	(self arguments includes: anArguments) ifFalse: [ self arguments add: anArguments ].
	self individualAssociations add: anArguments -> { aTarget }.
	self groupedAssociations
		at: anArguments
		ifPresent: [ :col | col add: aTarget ]
		ifAbsentPut: [
			OrderedCollection new
				add: aTarget;
				yourself ]
]
