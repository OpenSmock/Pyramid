Class {
	#name : #PyramidAbstractGroupCommand,
	#superclass : #PyramidCommand,
	#category : 'Pyramid-Bloc-plugin-bloc'
}

{ #category : #testing }
PyramidAbstractGroupCommand class >> isAbstract [

	^ self == PyramidAbstractGroupCommand
]

{ #category : #'as yet unclassified' }
PyramidAbstractGroupCommand >> getValueFor: aBlElement [

	^ nil
]

{ #category : #'as yet unclassified' }
PyramidAbstractGroupCommand >> saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments [

	| mementos |
	mementos := aCollection asArray collect: [ :each |
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
