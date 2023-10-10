Class {
	#name : #PyramidBasicConstraintsCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : 'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #testing }
PyramidBasicConstraintsCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject hasParent and: [
			  self targetsLayoutClass includes: anObject parent layout class ] ]
]

{ #category : #'as yet unclassified' }
PyramidBasicConstraintsCommand >> targetsLayoutClass [

	^ {
		  BlBasicLayout.
		  BlFlowLayout }
]
