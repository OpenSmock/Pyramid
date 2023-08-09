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
		BlProportionalLayout new
		 }
]

{ #category : #tests }
PyramidLayoutInputPresenterTest >> makeNewInput [

	^ PyramidLayoutInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput buttonBasic click
]
