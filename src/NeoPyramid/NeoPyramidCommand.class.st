Class {
	#name : #NeoPyramidCommand,
	#superclass : #Object,
	#category : #'NeoPyramid-command'
}

{ #category : #testing }
NeoPyramidCommand >> canBeUsedFor: anObject [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
NeoPyramidCommand >> clusterOf: aCollection [

	| users cluster |
	cluster := NeoPyramidCluster new.
	users := aCollection select: [ :each | self canBeUsedFor: each ].
	users do: [ :each | cluster register: each forArguments: (self getValueFor: each) ].
	^ cluster
]

{ #category : #'as yet unclassified' }
NeoPyramidCommand >> commandInverse [

	^ self
]

{ #category : #'as yet unclassified' }
NeoPyramidCommand >> getValueFor: anObject [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
NeoPyramidCommand >> saveStatesOf: aCollection with: arguments [

	^ self saveStatesOf: aCollection withCommand: self withArguments: arguments
]

{ #category : #'as yet unclassified' }
NeoPyramidCommand >> saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments [

	| mementos |
	mementos := aCollection collect: [ :each |
		            NeoPyramidCommandMemento new
			            command: aCommand;
			            target: each;
			            arguments: (self getValueFor: each);
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ NeoPyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]

{ #category : #'as yet unclassified' }
NeoPyramidCommand >> saveStatesWithCommandInverseOf: aCollection with: arguments [

	^ self saveStatesOf: aCollection withCommand: self commandInverse withArguments: arguments
]

{ #category : #'as yet unclassified' }
NeoPyramidCommand >> setValueFor: anObject with: anArgument [

	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
NeoPyramidCommand >> useOn: aCollection with: anArgument [

	aCollection do: [ :each | self setValueFor: each with: anArgument ]
]
