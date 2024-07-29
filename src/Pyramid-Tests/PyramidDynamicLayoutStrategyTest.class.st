Class {
	#name : #PyramidDynamicLayoutStrategyTest,
	#superclass : #TestCase,
	#category : 'Pyramid-Tests-cases-plugin-dynamic-layout'
}

{ #category : #tests }
PyramidDynamicLayoutStrategyTest >> testLayoutFor [

	self
		testLayoutForStrategy: PyramidDynamicLayoutAllPanels new
		withExpectedNoteBooks: 2.
	self
		testLayoutForStrategy: PyramidDynamicLayoutOnlyCenter new
		withExpectedNoteBooks: 0.
	self
		testLayoutForStrategy: PyramidDynamicLayoutOnlyLeft new
		withExpectedNoteBooks: 1.
	self
		testLayoutForStrategy: PyramidDynamicLayoutOnlyRight new
		withExpectedNoteBooks: 1
]

{ #category : #tests }
PyramidDynamicLayoutStrategyTest >> testLayoutForStrategy: aLayoutStrategy withExpectedNoteBooks: aNumber [

	| presenters |
	presenters := SpPresenter new
		              layout:
			              (aLayoutStrategy layoutFor:
					               PyramidWindow new);
		              allPresenters.
	self
		assert:
		(presenters select: [ :each | each class = SpNotebookPresenter ])
			size
		equals: aNumber
]
