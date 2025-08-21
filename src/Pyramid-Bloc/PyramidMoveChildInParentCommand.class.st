Class {
	#name : #PyramidMoveChildInParentCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'mementoInverse'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidMoveChildInParentCommand >> getValueFor: aBlElement [

	^ nil
]

{ #category : #'as yet unclassified' }
PyramidMoveChildInParentCommand >> saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments [

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
