Class {
	#name : #PyramidBasicHorizontalConstraintsBlocCommand,
	#superclass : #PyramidBasicConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidBasicHorizontalConstraintsBlocCommand >> getValueFor: anObject [

	^ anObject constraints horizontal
]

{ #category : #'as yet unclassified' }
PyramidBasicHorizontalConstraintsBlocCommand >> saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments [

	| mementos |
	mementos := aCollection collect: [ :each |
		            PyramidCommandMemento new
			            command: aCommand;
			            target: each;
			            arguments: (self getValueFor: each) asPyramidConstraintsArgument;
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ PyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidBasicHorizontalConstraintsBlocCommand >> setValueFor: anObject with: anArgument [

	anArgument isSymbol
		ifFalse: [
			anObject constraintsDo: [ :c |
				c horizontal perform: anArgument first with: anArgument last ] ]
		ifTrue: [
		anObject constraintsDo: [ :c | c horizontal perform: anArgument ] ]
]
