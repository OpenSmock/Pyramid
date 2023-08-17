Class {
	#name : #PyramidCluster,
	#superclass : #Object,
	#instVars : [
		'allTargets',
		'arguments',
		'groupedAssociations',
		'individualAssociations'
	],
	#category : #'Pyramid-commands'
}

{ #category : #'as yet unclassified' }
PyramidCluster >> allTargets [
	"Collection of all targets of the cluster"

	^ allTargets
]

{ #category : #accessing }
PyramidCluster >> arguments [
	"Collection of all arguments of the cluster"

	^ arguments
]

{ #category : #accessing }
PyramidCluster >> groupedAssociations [
	"Collection of association with:
	- key: anArgument
	- value: { aTarget . aTarget }"

	^ groupedAssociations
]

{ #category : #accessing }
PyramidCluster >> individualAssociations [
	"Collection of association with:
	- key: anArgument
	- value: { aTarget } (only one item in collection)"

	^ individualAssociations
]

{ #category : #initialization }
PyramidCluster >> initialize [

	allTargets := OrderedCollection new.
	arguments := OrderedCollection new.
	groupedAssociations := Dictionary new.
	individualAssociations := OrderedCollection new
]

{ #category : #testing }
PyramidCluster >> isEmpty [

	^ self arguments isEmpty
]

{ #category : #testing }
PyramidCluster >> isNotEmpty [

	^ self isEmpty not
]

{ #category : #testing }
PyramidCluster >> isTargetsSameArguments [
	"true if all targets have the same argument."
	^ self arguments size = 1
]

{ #category : #'as yet unclassified' }
PyramidCluster >> register: aTarget forArguments: anArguments [

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

{ #category : #accessing }
PyramidCluster >> size [

	^ self allTargets size
]
