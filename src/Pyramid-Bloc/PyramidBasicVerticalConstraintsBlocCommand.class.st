Class {
	#name : #PyramidBasicVerticalConstraintsBlocCommand,
	#superclass : #PyramidBasicConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidBasicVerticalConstraintsBlocCommand >> getValueFor: anObject [

	^ anObject constraints vertical
]

{ #category : #'as yet unclassified' }
PyramidBasicVerticalConstraintsBlocCommand >> saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments [

	| mementos |
	mementos := aCollection collect: [ :each |
		            PyramidCommandMemento new
			            command: aCommand;
			            target: each;
			            arguments:
				            (self getValueFor: each) asPyramidConstraintsArgument;
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ PyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidBasicVerticalConstraintsBlocCommand >> setValueFor: anObject with: anArgument [

	anArgument isSymbol
		ifFalse: [
			anObject constraintsDo: [ :c |
				c vertical perform: anArgument first with: anArgument last ] ]
		ifTrue: [
		anObject constraintsDo: [ :c | c vertical perform: anArgument ] ]
]
