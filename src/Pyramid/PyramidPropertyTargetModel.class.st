Class {
	#name : #PyramidPropertyTargetModel,
	#superclass : #Object,
	#instVars : [
		'argumentsDict',
		'targets'
	],
	#category : #'Pyramid-properties'
}

{ #category : #accessing }
PyramidPropertyTargetModel >> argumentsDict [

	^ argumentsDict
]

{ #category : #accessing }
PyramidPropertyTargetModel >> at: anArgument put: aTarget [

	self argumentsDict at: anArgument ifPresent: [ :col | col add: aTarget ] ifAbsentPut: [ OrderedCollection new add: aTarget; yourself ].
	self targets add: aTarget
]

{ #category : #initialization }
PyramidPropertyTargetModel >> initialize [

	argumentsDict := Dictionary new.
	targets := Set new
]

{ #category : #testing }
PyramidPropertyTargetModel >> isEmpty [

	^ argumentsDict isEmpty
]

{ #category : #testing }
PyramidPropertyTargetModel >> isNotEmpty [

	^ argumentsDict isNotEmpty
]

{ #category : #initialization }
PyramidPropertyTargetModel >> reset [
	self targets removeAll.
	self argumentsDict removeAll.
]

{ #category : #accessing }
PyramidPropertyTargetModel >> size [

	^ self targets size
]

{ #category : #accessing }
PyramidPropertyTargetModel >> targets [

	^ targets
]

{ #category : #accessing }
PyramidPropertyTargetModel >> targetsAt: aKey [

	^ self argumentsDict at: aKey ifAbsent: [ {  } ]
]
