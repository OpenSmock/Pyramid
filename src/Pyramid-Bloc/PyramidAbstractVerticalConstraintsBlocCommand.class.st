Class {
	#name : #PyramidAbstractVerticalConstraintsBlocCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidAbstractVerticalConstraintsBlocCommand class >> isAbstract [

	^ self == PyramidAbstractVerticalConstraintsBlocCommand
]

{ #category : #'as yet unclassified' }
PyramidAbstractVerticalConstraintsBlocCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject hasParent and: [
			  anObject parent layout class == self targetLayoutClass ] ]
]

{ #category : #'as yet unclassified' }
PyramidAbstractVerticalConstraintsBlocCommand >> getValueFor: anObject [

	^ anObject constraints vertical
]

{ #category : #'as yet unclassified' }
PyramidAbstractVerticalConstraintsBlocCommand >> setValueFor: anObject with: anArgument [

	anArgument isSymbol
		ifFalse: [
			anObject constraintsDo: [ :c |
				c vertical perform: anArgument first with: anArgument last ] ]
		ifTrue: [
		anObject constraintsDo: [ :c | c vertical perform: anArgument ] ]
]

{ #category : #'as yet unclassified' }
PyramidAbstractVerticalConstraintsBlocCommand >> targetLayoutClass [

	^ self shouldBeImplemented
]
