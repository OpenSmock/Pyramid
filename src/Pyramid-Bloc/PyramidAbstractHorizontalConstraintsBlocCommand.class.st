Class {
	#name : #PyramidAbstractHorizontalConstraintsBlocCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidAbstractHorizontalConstraintsBlocCommand class >> isAbstract [

	^ self == PyramidAbstractHorizontalConstraintsBlocCommand
]

{ #category : #'as yet unclassified' }
PyramidAbstractHorizontalConstraintsBlocCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject hasParent and: [
			  anObject parent layout class == self targetLayoutClass ] ]
]

{ #category : #'as yet unclassified' }
PyramidAbstractHorizontalConstraintsBlocCommand >> getValueFor: anObject [

	^ anObject constraints horizontal
]

{ #category : #'as yet unclassified' }
PyramidAbstractHorizontalConstraintsBlocCommand >> setValueFor: anObject with: anArgument [

	anArgument isSymbol
		ifFalse: [
			anObject constraintsDo: [ :c |
				c horizontal perform: anArgument first with: anArgument last ] ]
		ifTrue: [
		anObject constraintsDo: [ :c | c horizontal perform: anArgument ] ]
]

{ #category : #'as yet unclassified' }
PyramidAbstractHorizontalConstraintsBlocCommand >> targetLayoutClass [

	^ self shouldBeImplemented
]
