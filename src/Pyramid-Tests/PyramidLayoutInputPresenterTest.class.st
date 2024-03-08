Class {
	#name : #PyramidLayoutInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidLayoutInputPresenterTest >> dummyValues [

	^ {
		  BlBasicLayout new.
		  BlFlowLayout horizontal.
		  BlFlowLayout vertical.
		  BlLinearLayout horizontal.
		  BlLinearLayout vertical.
		BlFrameLayout new.
		  BlProportionalLayout new }
]

{ #category : #accessing }
PyramidLayoutInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidLayoutInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidLayoutInputPresenterTest >> makeNewInput [

	^ PyramidLayoutInputPresenter new
]

{ #category : #tests }
PyramidLayoutInputPresenterTest >> testValue [

	| input hasTrigger |
	hasTrigger := false.
	input := self makeNewInputWithModel.
	input whenValueChangedDo: [ :val | hasTrigger := true ].
	self dummyValues do: [ :each |
		self putValue: each onInput: input.
		self assert: (self equalityTestFor: each class and: input value class) ]
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput valueButtons first click
]
