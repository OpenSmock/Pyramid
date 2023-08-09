Class {
	#name : #PyramidBasicConstraintsBlocCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidBasicConstraintsBlocCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject hasParent and: [anObject parent layout class == BlBasicLayout ]]
]
