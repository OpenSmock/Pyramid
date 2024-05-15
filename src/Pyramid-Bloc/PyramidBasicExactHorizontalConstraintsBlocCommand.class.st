Class {
	#name : 'PyramidBasicExactHorizontalConstraintsBlocCommand',
	#superclass : 'PyramidBasicConstraintsCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'as yet unclassified' }
PyramidBasicExactHorizontalConstraintsBlocCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
			  anObject constraints horizontal resizer isExact ]
]

{ #category : 'as yet unclassified' }
PyramidBasicExactHorizontalConstraintsBlocCommand >> getValueFor: anObject [

^ anObject constraints horizontal resizer size
]

{ #category : 'as yet unclassified' }
PyramidBasicExactHorizontalConstraintsBlocCommand >> setValueFor: anObject with: anArgument [

	^ anObject constraintsDo: [ :c | c horizontal exact: anArgument ] 
]
