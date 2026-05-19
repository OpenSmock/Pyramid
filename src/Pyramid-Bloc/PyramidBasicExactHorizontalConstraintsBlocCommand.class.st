Class {
	#name : #PyramidBasicExactHorizontalConstraintsBlocCommand,
	#superclass : #PyramidBasicConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidBasicExactHorizontalConstraintsBlocCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
			  anObject constraints horizontal resizer isExact ]
]

{ #category : #getter }
PyramidBasicExactHorizontalConstraintsBlocCommand >> getValueFor: anObject [

^ anObject constraints horizontal resizer size
]

{ #category : #setter }
PyramidBasicExactHorizontalConstraintsBlocCommand >> setValueFor: anObject with: anArgument [

	^ anObject constraintsDo: [ :c | c horizontal exact: anArgument ] 
]
