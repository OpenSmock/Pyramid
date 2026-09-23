Class {
	#name : #PyramidBasicExactVerticalConstraintsBlocCommand,
	#superclass : #PyramidBasicConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidBasicExactVerticalConstraintsBlocCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject constraints vertical resizer isExact ]
]

{ #category : #getter }
PyramidBasicExactVerticalConstraintsBlocCommand >> getValueFor: anObject [

	^ anObject constraints vertical resizer size
]

{ #category : #setter }
PyramidBasicExactVerticalConstraintsBlocCommand >> setValueFor: anObject with: anArgument [

	^ anObject constraintsDo: [ :c | c vertical exact: anArgument ]
]
