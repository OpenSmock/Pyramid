"
I get and change the property of every element in a selection.

+ canBeUsedFor: anObject > return true if the command can be used by anObject
+ commandInverse > return a `PyramidCommand` corresponding to the inverse command (for example, add to a collection = remove to a collection, set a property = the same command).
+ getValueFor: anObject > return the value of the property
+ setValueFor: anObject with: anArgument > set anArgument as the property of anObject

In some rare case, the method saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments should be changed. This method create the ` NeoPyramidAbstractMemento` used by the `NeoPyramidHistory`. For some property the memento argument should not be the current element state but other thing.

"
Class {
	#name : #NeoPyramidCommand,
	#superclass : #Object,
	#category : #'NeoPyramid-command'
}

{ #category : #testing }
NeoPyramidCommand class >> isAbstract [

	^ self == NeoPyramidCommand
]

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
