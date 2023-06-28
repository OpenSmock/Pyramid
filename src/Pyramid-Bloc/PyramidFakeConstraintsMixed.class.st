Class {
	#name : #PyramidFakeConstraintsMixed,
	#superclass : #Object,
	#instVars : [
		'isVertical'
	],
	#category : #'Pyramid-Bloc-custom-specs-constraints'
}

{ #category : #factory }
PyramidFakeConstraintsMixed >> horizontal [

	isVertical := false.
	^ self
]

{ #category : #accessing }
PyramidFakeConstraintsMixed >> isVertical [
^ isVertical 
]

{ #category : #'as yet unclassified' }
PyramidFakeConstraintsMixed >> pyramidSelectConstraintsOn: aPyramidConstraintsPresenter [

	self isVertical ifTrue: [aPyramidConstraintsPresenter model: PyramidConstraintsModel verticalMixed.  ] ifFalse: [ aPyramidConstraintsPresenter model: PyramidConstraintsModel horizontalMixed. ].
	
]

{ #category : #factory }
PyramidFakeConstraintsMixed >> vertical [

	isVertical := true.
	^ self
]
