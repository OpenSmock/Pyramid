Class {
	#name : #PyramidCollectionCommand,
	#superclass : #PyramidCommand,
	#category : 'Pyramid-commands'
}

{ #category : #testing }
PyramidCollectionCommand class >> isAbstract [

	^ self == PyramidCollectionCommand
]

{ #category : #testing }
PyramidCollectionCommand >> canBeUsedFor: anObject [

	^ anObject isCollection
]

{ #category : #'as yet unclassified' }
PyramidCollectionCommand >> saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments [

	| mementos |
	mementos := aCollection collect: [ :each |
		            PyramidCommandMemento new
			            command: aCommand;
			            target: each;
			            arguments: anArguments;
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ PyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]
