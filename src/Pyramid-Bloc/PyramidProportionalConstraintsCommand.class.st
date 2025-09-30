Class {
	#name : #PyramidProportionalConstraintsCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #testing }
PyramidProportionalConstraintsCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject hasParent and: [
			  BlProportionalLayout = anObject parent layout class ] ]
]
