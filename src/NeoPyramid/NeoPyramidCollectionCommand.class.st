Class {
	#name : #NeoPyramidCollectionCommand,
	#superclass : #NeoPyramidCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #testing }
NeoPyramidCollectionCommand >> canBeUsedFor: anObject [

	^ anObject isCollection
]

{ #category : #'as yet unclassified' }
NeoPyramidCollectionCommand >> saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments [

	| mementos |
	mementos := aCollection collect: [ :each |
		            NeoPyramidCommandMemento new
			            command: aCommand;
			            target: each;
			            arguments: anArguments;
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ NeoPyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]
