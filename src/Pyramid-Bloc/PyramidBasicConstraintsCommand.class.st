Class {
	#name : #PyramidBasicConstraintsCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidBasicConstraintsCommand >> authorizedLayouts [


	^ { BlBasicLayout . BlFlowLayout . BlLinearLayout . BlFrameLayout }
]

{ #category : #testing }
PyramidBasicConstraintsCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject hasParent and: [
			  self authorizedLayouts includes: anObject parent layout class ] ]
]
