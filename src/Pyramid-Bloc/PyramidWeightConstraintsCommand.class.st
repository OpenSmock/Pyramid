Class {
	#name : #PyramidWeightConstraintsCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #testing }
PyramidWeightConstraintsCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
			anObject hasParent and: [ 
		   { BlFlowLayout . BlLinearLayout } includes: anObject parent layout class ] ]
]

{ #category : #'as yet unclassified' }
PyramidWeightConstraintsCommand >> getValueFor: anObject [

	^ anObject constraints linear weight
]

{ #category : #'as yet unclassified' }
PyramidWeightConstraintsCommand >> setValueFor: anObject with: anArgument [

	anObject constraints linear weight: anArgument.
	anObject parent forceLayout
]
