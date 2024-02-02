Class {
	#name : #PyramidFrameConstraintsCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #testing }
PyramidFrameConstraintsCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject hasParent and: [
			  BlFrameLayout = anObject parent layout class ] ]
]
