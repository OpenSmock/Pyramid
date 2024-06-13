Class {
	#name : 'PyramidCluster',
	#superclass : 'Object',
	#instVars : [
		'allTargets',
		'groups',
		'groupedAssociations',
		'individualAssociations'
	],
	#category : 'Pyramid-commands',
	#package : 'Pyramid',
	#tag : 'commands'
}

{ #category : 'as yet unclassified' }
PyramidCluster >> allTargets [
	"Collection of all targets of the cluster"

	^ allTargets
]

{ #category : 'accessing' }
PyramidCluster >> groupedAssociations [
	"Collection of association with:
	- key: anArgument
	- value: { aTarget . aTarget }"

	^ groupedAssociations
]

{ #category : 'accessing' }
PyramidCluster >> groups [
	"Collection of all groups of the cluster. By default the #getValueFor: result."

	^ groups
]

{ #category : 'accessing' }
PyramidCluster >> individualAssociations [
	"Collection of association with:
	- key: anArgument
	- value: { aTarget } (only one item in collection)"

	^ individualAssociations
]

{ #category : 'initialization' }
PyramidCluster >> initialize [

	allTargets := OrderedCollection new.
	groups := OrderedCollection new.
	groupedAssociations := Dictionary new.
	individualAssociations := OrderedCollection new
]

{ #category : 'testing' }
PyramidCluster >> isEmpty [

	^ self groups isEmpty
]

{ #category : 'testing' }
PyramidCluster >> isNotEmpty [

	^ self isEmpty not
]

{ #category : 'testing' }
PyramidCluster >> isTargetsSameArguments [
	"true if all targets have the same argument."

	^ self groups size = 1
]

{ #category : 'as yet unclassified' }
PyramidCluster >> register: aTarget forArguments: anArguments [

	(self allTargets includes: aTarget) ifTrue: [ ^ self ].
	self allTargets add: aTarget.
	(self groups includes: anArguments) ifFalse: [
		self groups add: anArguments ].
	self individualAssociations add: anArguments -> { aTarget }.
	self groupedAssociations
		at: anArguments
		ifPresent: [ :col | col add: aTarget ]
		ifAbsentPut: [
			OrderedCollection new
				add: aTarget;
				yourself ]
]

{ #category : 'accessing' }
PyramidCluster >> size [

	^ self allTargets size
]
