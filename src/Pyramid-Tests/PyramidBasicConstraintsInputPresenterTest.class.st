Class {
	#name : 'PyramidBasicConstraintsInputPresenterTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom',
	#package : 'Pyramid-Tests',
	#tag : 'cases-specs-custom'
}

{ #category : 'accessing' }
PyramidBasicConstraintsInputPresenterTest >> dummyValues [

	^ {
		  BlLayoutCommonConstraintsAxis new matchParent.
		  BlLayoutCommonConstraintsAxis new fitContent.
		   BlLayoutCommonConstraintsAxis new exact: 50.
		BlLayoutCommonConstraintsAxis new exact: 200. }
]

{ #category : 'tests' }
PyramidBasicConstraintsInputPresenterTest >> makeNewInput [

	^ PyramidBasicConstraintsInputPresenter new
]

{ #category : 'tests' }
PyramidBasicConstraintsInputPresenterTest >> testValue [

	| input hasTrigger |
	hasTrigger := false.
	input := self makeNewInputWithModel.
	input whenValueChangedDo: [ :val | hasTrigger := true ].
	self dummyValues do: [ :each |
		self putValue: each onInput: input.
		self assert: (self equalityTestFor: each asPyramidConstraintsArgument and: input value) ]
]

{ #category : 'as yet unclassified' }
PyramidBasicConstraintsInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput buttonExact click
]
