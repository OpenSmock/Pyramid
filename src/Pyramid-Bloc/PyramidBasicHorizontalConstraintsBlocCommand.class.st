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
PyramidBasicHorizontalConstraintsBlocCommand >> setValueFor: anObject with: anArgument [

	anArgument isSymbol
		ifFalse: [
			anObject constraintsDo: [ :c |
				c horizontal perform: anArgument first with: anArgument last ] ]
		ifTrue: [
		anObject constraintsDo: [ :c | c horizontal perform: anArgument ] ]
]
